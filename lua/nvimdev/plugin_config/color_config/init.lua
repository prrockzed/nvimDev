-- colorschemes configuration goes here
require("nvimdev.plugin_config.color_config.onedark")

-- colorscheme configuration
local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end
