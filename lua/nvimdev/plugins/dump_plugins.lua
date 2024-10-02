-- dumping all the plugins here

local plugins_list = {
  -- which-key plugin
  {
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/lazydev.nvim",
  },

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim" ,},
	},
	    {
		"nvim-telescope/telescope-ui-select.nvim", -- sets vim.ui.select to telescope
		event = "VeryLazy",
	},

	-- tabline at the top
	{
		"romgrk/barbar.nvim",
		lazy = false,
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},

	-- status line at the bottom
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

  -- colorscheme plugins
  {
		"navarasu/onedark.nvim",
		lazy = false,
  },
	{
		"EdenEast/nightfox.nvim",
		event = "VeryLazy",
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
	},
	{
		"romgrk/doom-one.vim",
		event = "VeryLazy",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
	},
	{
		"rebelot/kanagawa.nvim",
		event = "VeryLazy",
	},
	{
		"ellisonleao/gruvbox.nvim",
		event = "VeryLazy",
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
