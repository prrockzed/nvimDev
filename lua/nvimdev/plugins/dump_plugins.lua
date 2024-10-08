-- dumping all the plugins here

local plugins_list = {

	-- Plugin manager: Lazy.nvim
	{ 
	  "folke/lazy.nvim",
	  version = "latest", -- Always keep it updated
	},
  
	-- Which-key for keybinding suggestions
	{
	  "folke/which-key.nvim",
	  version = "v1.6.0",
	  config = function()
		require("which-key").setup {}
	  end,
	},
  
	-- Neovim configuration helper
	{ 
	  "folke/neoconf.nvim",
	  cmd = "Neoconf",
	},
	{
	  "folke/lazydev.nvim",
	},
  
	-- Telescope and extensions for fuzzy searching
	{
	  "nvim-telescope/telescope.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  lazy = false,
	  config = function()
		require("telescope").setup {}
	  end,
	},
	{
	  "nvim-telescope/telescope-live-grep-args.nvim",
	  event = "VeryLazy", -- Load when required
	  config = function()
		require("telescope").load_extension("live_grep_args")
	  end,
	},
	{
	  "nvim-telescope/telescope-ui-select.nvim", -- Overwrites vim.ui.select with telescope
	  event = "VeryLazy",
	  config = function()
		require("telescope").load_extension("ui-select")
	  end,
	},
  
	-- Project management
	{
	  "ahmedkhalf/project.nvim",
	  lazy = false,
	  config = function()
		require("project_nvim").setup {}
	  end,
	},
  
	-- Tabline plugin for better buffer/tab management
	{
	  "romgrk/barbar.nvim",
	  lazy = false,
	  dependencies = {
		"lewis6991/gitsigns.nvim", -- Git status integration
		"nvim-tree/nvim-web-devicons", -- File icons
	  },
	  version = "^1.0.0",
	  config = function()
		require("barbar").setup {}
	  end,
	},
  
	-- Status line at the bottom of the editor
	{
	  "nvim-lualine/lualine.nvim",
	  lazy = false,
	  dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons
	  config = function()
		require("lualine").setup {
		  options = {
			theme = "auto", -- Automatically adapts to your colorscheme
		  },
		}
	  end,
	},
  
	-- Colorschemes
	{
	  "olimorris/onedarkpro.nvim", -- Default colorscheme
	  priority = 1000, -- Ensure it loads first
	  config = function()
		vim.cmd([[colorscheme onedarkpro]])
	  end,
	},
	{
	  "EdenEast/nightfox.nvim",
	  event = "VeryLazy",
	},
	{
	  "folke/tokyonight.nvim",
	  event = "VeryLazy",
	  config = function()
		require("tokyonight").setup({
		  style = "night", -- Choose between "storm", "night", "day"
		  transparent = false, -- Disable transparency
		})
	  end,
	},
	{
	  "romgrk/doom-one.vim",
	  event = "VeryLazy",
	},
	{
	  "catppuccin/nvim",
	  name = "catppuccin",
	  event = "VeryLazy",
	  config = function()
		require("catppuccin").setup({
		  flavour = "macchiato", -- Options: latte, frappe, macchiato, mocha
		})
		vim.cmd([[colorscheme catppuccin]])
	  end,
	},
	{
	  "rebelot/kanagawa.nvim",
	  event = "VeryLazy",
	},
	{
	  "ellisonleao/gruvbox.nvim",
	  event = "VeryLazy",
	  config = function()
		require("gruvbox").setup {
		  contrast = "hard",
		}
	  end,
	},
  
	-- Nvim-tree for file exploration
	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = { "nvim-tree/nvim-web-devicons" },
	  config = function()
		require("nvim-tree").setup {}
	  end,
	},
  
}

return plugins_list
