local M = {}

-- Function to update nvimDev without Git
M.update_without_git = function()
  local nvim_config_path = vim.fn.stdpath("config") -- ~/.config/nvim
  local temp_archive = "/tmp/nvimdev_latest.zip" -- Temporary file for archive
  local remote_url = "https://github.com/prrockzed/nvimdev/archive/refs/heads/main.zip" -- Archive URL
  local extracted_folder = "/tmp/nvimdev-main" -- Extracted folder

  vim.notify("Downloading the latest nvimDev setup...", vim.log.levels.INFO)

  -- Helper function to clean up temporary files and folders
  local function cleanup_tmp_files()
    local uv = vim.loop

    -- Recursive function to remove a directory and its contents
    local function remove_dir(directory)
      local function scandir(dir)
        local handle = uv.fs_scandir(dir)
        if handle then
          local function iterator()
            return uv.fs_scandir_next(handle)
          end
          return iterator
        end
      end

      for name in scandir(directory) do
        local path = directory .. "/" .. name
        local stat = uv.fs_stat(path)
        if stat then
          if stat.type == "file" then
            uv.fs_unlink(path) -- Remove file
          elseif stat.type == "directory" then
            remove_dir(path) -- Recursively remove directory contents
            uv.fs_rmdir(path) -- Remove empty directory
          end
        end
      end

      -- Finally remove the main directory
      uv.fs_rmdir(directory)
    end

    -- Remove the zip file
    if uv.fs_stat(temp_archive) then
      uv.fs_unlink(temp_archive)
    end

    -- Remove the extracted folder
    if uv.fs_stat(extracted_folder) then
      remove_dir(extracted_folder)
    end

    vim.notify("Temporary files cleaned up.", vim.log.levels.INFO)
  end

  -- Helper function to clean up the Neovim configuration directory
  local function clean_nvim_config_dir()
    local uv = vim.loop

    -- Recursive function to remove a directory and its contents
    local function remove_dir(directory)
      local function scandir(dir)
        local handle = uv.fs_scandir(dir)
        if handle then
          local function iterator()
            return uv.fs_scandir_next(handle)
          end
          return iterator
        end
      end

      for name in scandir(directory) do
        local path = directory .. "/" .. name
        local stat = uv.fs_stat(path)
        if stat then
          if stat.type == "file" then
            uv.fs_unlink(path) -- Remove file
          elseif stat.type == "directory" then
            remove_dir(path) -- Recursively remove directory contents
            uv.fs_rmdir(path) -- Remove empty directory
          end
        end
      end

      -- Finally remove the main directory
      uv.fs_rmdir(directory)
    end

    if uv.fs_stat(nvim_config_path) then
      -- Recursively delete contents of nvim_config_path
      remove_dir(nvim_config_path)
      vim.notify("Neovim configuration directory cleaned.", vim.log.levels.INFO)
    else
      vim.notify("Neovim configuration directory not found, creating a new one.", vim.log.levels.INFO)
      vim.fn.mkdir(nvim_config_path, "p") -- Ensure the folder exists
    end
  end

  -- Step 1: Download the archive
  vim.fn.jobstart({ "curl", "-L", "-o", temp_archive, remote_url }, {
    on_exit = function(_, curl_exit_code)
      if curl_exit_code == 0 then
        vim.notify("Download complete.", vim.log.levels.INFO)

        -- Step 2: Unzip the archive
        vim.fn.jobstart({ "unzip", "-o", temp_archive, "-d", "/tmp" }, {
          on_exit = function(_, unzip_exit_code)
            if unzip_exit_code == 0 then
              vim.notify("Unzipping complete.", vim.log.levels.INFO)

              -- Step 3: Clean the Neovim configuration directory
              clean_nvim_config_dir()

              -- Step 4: Copy the extracted files to the Neovim config directory
              local function copy_dir(src, dest)
                local uv = vim.loop

                local function scandir(directory)
                  local handle = uv.fs_scandir(directory)
                  if handle then
                    local function iterator()
                      return uv.fs_scandir_next(handle)
                    end
                    return iterator
                  end
                end

                for name in scandir(src) do
                  local src_path = src .. "/" .. name
                  local dest_path = dest .. "/" .. name

                  local stat = uv.fs_stat(src_path)
                  if stat and stat.type == "file" then
                    uv.fs_copyfile(src_path, dest_path)
                  elseif stat and stat.type == "directory" then
                    uv.fs_mkdir(dest_path, 511) -- 511 == 0777 in octal
                    copy_dir(src_path, dest_path) -- Recursive copy
                  end
                end
              end

              -- Copy the files
              vim.fn.mkdir(nvim_config_path, "p")
              copy_dir(extracted_folder, nvim_config_path)

              vim.notify("nvimDev updated! Happy coding!\nRestart Neovim to apply changes.", vim.log.levels.INFO)

              -- Step 5: Clean up the temporary files
              cleanup_tmp_files()
            else
              vim.notify("Failed to unzip the archive.", vim.log.levels.ERROR)
            end
          end
        })
      else
        vim.notify("Failed to download the update.", vim.log.levels.ERROR)
      end
    end
  })
end

return M
