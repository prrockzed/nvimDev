-- colorschemes configuration goes here
require("nvimdev.plugin_config.color_config.onedark")
require("nvimdev.plugin_config.color_config.nightfox")
require("nvimdev.plugin_config.color_config.tokyonight")
require("nvimdev.plugin_config.color_config.catppuccin")
require("nvimdev.plugin_config.color_config.kanagawa")
require("nvimdev.plugin_config.color_config.gruvbox")

-- list of external colorschemes
-- onedark
-- gruvbox
-- nightfox (nightfox, dayfox, dawnfox, duskfox, nordfox, terrafox, carbonfox)
-- tokyonight (tokyonight, tokyonight-day, tokyonight-moon, tokyonight-night, tokyonight-storm)
-- catppuccin (catppuccin, catppuccin-frappe, catppuccin-latte, catppuccin-mocha, catppuccin-macchiato)
-- kanagawa (kanagawa, kanagawa-dragon, kanagawa-lotus, kanagawa-wave)
-- doom-one (imported from emacs)

-- colorscheme configuration
local colorscheme = "onedark"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
	return
end
