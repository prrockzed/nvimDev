local M = {}

-- Function to update nvimDev without Git
M.update_without_git = function()
  local nvim_config_path = vim.fn.stdpath("config") -- ~/.config/nvim
  local temp_archive = "/tmp/nvimdev_latest.zip" -- Temporary file for archive
  local remote_url = "https://github.com/prrockzed/nvimdev/archive/refs/heads/main.zip" -- Archive URL
  local extracted_folder = "/tmp/nvimdev-main" -- Extracted folder

  vim.notify("Downloading the latest nvimDev setup...", vim.log.levels.INFO)

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

              -- Step 3: Copy the extracted files to the Neovim config directory
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

              vim.notify("nvimDev updated! Restart Neovim to apply changes.", vim.log.levels.INFO)
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
