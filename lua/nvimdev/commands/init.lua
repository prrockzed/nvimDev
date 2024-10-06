-- Creates a new Nvimdev command to update the config
-- It pulls the changes from the latest commit
-- Comes with all the new features, but along with unknown bugs
vim.api.nvim_create_user_command("NvimdevUpdateNightly", function()
  require('nvimdev.commands.nightly_update').update_nvimdev()
end, { desc = "Updates nvimDev Nightly" })

-- Creates a new Nvimdev command to update the config
-- It pull changes from the latest released version 
-- Comes with all the tested features leaving little room for bugs
vim.api.nvim_create_user_command("NvimdevUpdateStable", function()
  require('nvimdev.commands.stable_update').update_nvimdev()
end, { desc = "Updates nvimDev Stably" })
