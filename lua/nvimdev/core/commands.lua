local M = {}

-- Function to check for unstaged changes
local function check_for_unstaged_changes()
  local handle = io.popen("git status --porcelain")
  local result = handle:read("*a")
  handle:close()
  return result ~= ""
end

-- Function to stage and commit changes
local function stage_and_commit_changes(callback)
  vim.notify("Staging your changes...", vim.log.levels.INFO)

  -- First stage the changes
  vim.fn.jobstart({ "git", "add", "." }, {
    on_exit = function()
      -- Ask the user for a commit message
      vim.ui.input({
        prompt = "Enter a commit message (leave blank for auto-commit): ",
      }, function(input)
        -- If the user provides a message, use it; otherwise, use the default message
        local commit_message = input ~= nil and input ~= "" and input or "Auto-commit: Staging changes before rebase"
        
        -- Proceed with committing the changes
        vim.fn.jobstart({ "git", "commit", "-m", commit_message }, {
          on_exit = function(_, commit_exit_code)
            if commit_exit_code == 0 then
              vim.notify("Changes successfully committed with message: " .. commit_message, vim.log.levels.INFO)
              callback()
            else
              vim.notify("Failed to commit changes.", vim.log.levels.ERROR)
            end
          end
        })
      end)
    end
  })
end

-- Function to update nvimDev with Git
local function update_with_git()
  -- Check for unstaged changes first
  if check_for_unstaged_changes() then
    vim.ui.input({
      prompt = "Unstaged changes detected!\nPlease commit your changes if you want to move forward.\nWould you like to automatically stage and commit them? (y/n): ",
      default = "",
    }, function(input)
      if input == "y" then
        -- Stage and commit changes, then proceed with the pull
        stage_and_commit_changes(function()
          update_with_git()
        end)
      else
        -- If the user says no, notify them and exit
        vim.notify("Please manually stage your changes before proceeding to update nvimDev.", vim.log.levels.ERROR)
      end
    end)
  else
    -- No unstaged changes, proceed with the git pull --rebase
    vim.notify("Pulling latest changes...")
    vim.fn.jobstart({ "git", "pull", "--rebase" }, {
      stdout_buffered = true,

      on_stdout = function(_, data)
        if data then
          for _, line in ipairs(data) do
            if line ~= "" then
              vim.notify(line, vim.log.levels.INFO)
            end
          end
        end
      end,

      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.notify("nvimDev is updated! Happy coding with nvimDev!", vim.log.levels.INFO)
        else
          vim.notify("Failed to update nvimDev. Please check the error messages above.", vim.log.levels.ERROR)
        end
      end,
    })
  end
end

-- Function to update nvimDev without Git
local function update_without_git()
  local nvim_config_path = vim.fn.stdpath("config") -- ~/.config/nvim
  local temp_archive = "/tmp/nvimdev_latest.zip" -- Temporary file to store the downloaded archive
  local remote_url = "https://github.com/prrockzed/nvimdev/archive/refs/heads/main.zip" -- URL to download the main branch archive
  local extracted_folder = "/tmp/nvimdev-main" -- Folder where the archive will be extracted

  vim.notify("Downloading the latest nvimDev setup...", vim.log.levels.INFO)

  -- Step 1: Download the latest archive
  vim.fn.jobstart({ "curl", "-L", "-o", temp_archive, remote_url }, {
    on_exit = function(_, curl_exit_code)
      if curl_exit_code == 0 then
        vim.notify("Download complete.", vim.log.levels.INFO)

        -- Step 2: Unzip the downloaded archive and overwrite the local files
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
                    copy_dir(src_path, dest_path) -- Recursive copy for directories
                  end
                end
              end

              -- Ensure the destination exists before copying
              vim.fn.mkdir(nvim_config_path, "p")
              copy_dir(extracted_folder, nvim_config_path)

              vim.notify("nvimDev updated successfully! Restart Neovim to apply changes.", vim.log.levels.INFO)
            else
              vim.notify("Failed to unzip the downloaded file.", vim.log.levels.ERROR)
            end
          end
        })
      else
        vim.notify("Failed to download the update.", vim.log.levels.ERROR)
      end
    end
  })
end

-- Function to detect if a .git folder exists in ~/.config/nvim
local function has_git_folder()
  local nvim_config_path = vim.fn.stdpath("config")
  local git_folder_path = nvim_config_path .. "/.git"
  return vim.fn.isdirectory(git_folder_path) == 1
end

-- Main function to update nvimDev based on the presence of the .git folder
M.update_nvimdev = function()
  if has_git_folder() then
    vim.notify("Git repository detected. Updating using Git...")
    update_with_git()
  else
    vim.notify("No Git repository found. Updating via archive download...")
    update_without_git()
  end
end

return M
