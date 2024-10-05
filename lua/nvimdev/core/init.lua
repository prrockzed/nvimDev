-- Core Files
require("nvimdev.core.keymaps")
require("nvimdev.core.options")

-- Creates a new Nvimdev command to update the config
vim.api.nvim_create_user_command("Nvimdevupdate", function()
  require('nvimdev.core.commands').update_nvimdev()
end, { desc = "Updates nvimDev" })
