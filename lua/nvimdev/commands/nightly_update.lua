local M = {}

local update_with_git = require('nvimdev.commands.nightly_git').update_with_git
local update_without_git = require('nvimdev.commands.nightly_nogit').update_without_git

-- Function to detect if a .git folder exists in ~/.config/nvim
local function has_git_folder()
  local nvim_config_path = vim.fn.stdpath("config")
  local git_folder_path = nvim_config_path .. "/.git"
  return vim.fn.isdirectory(git_folder_path) == 1
end

-- Main function to update nvimDev
M.update_nvimdev = function()
  if has_git_folder() then
    vim.notify("Git repository detected. Updating using Git...", vim.log.levels.INFO)
    update_with_git()
  else
    -- Ask the user if they want to update via archive download
    vim.ui.input({
      vim.notify("No Git repository found.", vim.log.levels.INFO),
      vim.notify("Warning: This will replace your current config with the latest version, and you will lose any custom configuration.", vim.log.levels.WARN),
      prompt = "Update via archive? (y/n): ",
      default = "",
    }, function(input)
      if input == "y" then
        vim.notify("Updating via archive download...", vim.log.levels.INFO)
        update_without_git()
      else
        vim.notify("Aborted: The config cannot be updated. Use a version with a .git folder to maintain your current config.", vim.log.levels.ERROR)
      end
    end)
  end
end

return M
