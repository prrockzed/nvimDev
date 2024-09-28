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
}

return plugins_list
