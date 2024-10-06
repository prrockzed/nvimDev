local M = {}

-- Function to detect if a .git folder exists in ~/.config/nvim
local function has_git_folder()
  local nvim_config_path = vim.fn.stdpath("config")
  local git_folder_path = nvim_config_path .. "/.git"
  return vim.fn.isdirectory(git_folder_path) == 1
end

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
  
  vim.fn.jobstart({ "git", "add", "." }, {
    on_exit = function()
      vim.ui.input({
        prompt = "Enter a commit message (leave blank for auto-commit): ",
      }, function(input)
        local commit_message = input ~= nil and input ~= "" and input or "Auto-commit: Staging changes before rebase"
        
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

-- Function to fetch and checkout the latest release
local function checkout_latest_release(callback)
  vim.fn.jobstart({ "git", "fetch", "--tags" }, {
    on_exit = function(_, fetch_exit_code)
      if fetch_exit_code == 0 then
        vim.notify("Fetched latest tags/releases.", vim.log.levels.INFO)
        
        vim.fn.jobstart({ "git", "describe", "--tags", "--abbrev=0" }, {
          stdout_buffered = true,
          on_stdout = function(_, data)
            if data and data[1] then
              local latest_tag = data[1]
              vim.notify("Latest release tag: " .. latest_tag, vim.log.levels.INFO)
              
              vim.fn.jobstart({ "git", "checkout", latest_tag }, {
                on_exit = function(_, checkout_exit_code)
                  if checkout_exit_code == 0 then
                    vim.notify("Checked out to latest release: " .. latest_tag, vim.log.levels.INFO)
                    callback()
                  else
                    vim.notify("Failed to checkout the latest release.", vim.log.levels.ERROR)
                  end
                end
              })
            else
              vim.notify("Could not find the latest release tag.", vim.log.levels.ERROR)
            end
          end
        })
      else
        vim.notify("Failed to fetch latest releases/tags.", vim.log.levels.ERROR)
      end
    end
  })
end

-- Main function to update nvimDev
M.update_nvimdev = function()
  if has_git_folder() then
    vim.notify("Git repository detected. Updating using Git...", vim.log.levels.INFO)
    if check_for_unstaged_changes() then
      vim.ui.input({
        prompt = "Unstaged changes detected!\nPlease commit your changes to proceed.\nWould you like to automatically stage and commit them? (y/n): ",
        default = "",
      }, function(input)
        if input == "y" then
          stage_and_commit_changes(function()
            M.update_with_git()
          end)
        else
          vim.notify("Please manually stage your changes before updating.", vim.log.levels.ERROR)
        end
      end)
    else
      vim.notify("Updating to the latest release...", vim.log.levels.INFO)
      checkout_latest_release(function()
        vim.notify("nvimDev updated to the latest release!", vim.log.levels.INFO)
      end)
      vim.notify("nvimDev updated! Happy coding!")
    end
  else
    vim.notify("No Git repository found. Couldn't Update to the latest version", vim.log.levels.INFO)
  end
end

return M
