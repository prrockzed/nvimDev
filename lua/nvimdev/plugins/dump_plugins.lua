-- dumping all the plugins here

local plugins_list = {
  -- which-key plugin
  {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/lazydev.nvim",
  },

  -- colorscheme plugins
  {
		"navarasu/onedark.nvim",
		lazy = false,
  },

	-- nvim tree (a file explorer)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
}

return plugins_list
