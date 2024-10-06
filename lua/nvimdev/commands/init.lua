-- Creates a new Nvimdev command to update the config
vim.api.nvim_create_user_command("NvimdevUpdateNightly", function()
  require('nvimdev.commands.update').update_nvimdev()
end, { desc = "Updates nvimDev" })
