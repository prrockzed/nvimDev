local M = {}

local update_with_git = require('nvimdev.commands.upd_with_git').update_with_git
local update_without_git = require('nvimdev.commands.upd_without_git').update_without_git

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
    vim.notify("No Git repository found. Updating via archive download...", vim.log.levels.INFO)
    update_without_git()
  end
end

return M

