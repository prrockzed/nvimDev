local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
  { "<leader>N", "<cmd> enew <CR>", desc = "New Buffer", nowait = true, remap = false },
  { "<leader>c", "<cmd> BufferClose <CR>", desc = "Close Buffer", nowait = true, remap = false },
  { "<leader>e", "<cmd> NvimTreeToggle<CR>", desc = "Nvim Tree Toggle", nowait = true, remap = false },
  { "<leader>q", "<cmd> q! <CR>", desc = "Quit", nowait = true, remap = false },
  { "<leader>w", "<cmd> w! <CR><CR>", desc = "Save", nowait = true, remap = false },
  { "<leader>f", "<cmd> Telescope find_files <CR>", desc = "Find Files", nowait = true, remap = false },
  { "<leader>p", "<cmd> Telescope projects <CR>", desc = "Projects", nowait = true, remap = false },

  -- Diagnostics
  { "<leader>d", group = "Diagnostics", nowait = true, remap = false },
  { "<leader>db", "<cmd> Telescope diagnostics bufnr=0 <CR>", desc = "Buffer Diagnostics", nowait = true, remap = false },
  { "<leader>dp", "<cmd> Telescope diagnostics <CR>", desc = "Workspace Diagnostics", nowait = true, remap = false },

  -- Finding files/texts etc
  { "<leader>F", group = "Find", nowait = true, remap = false },
  { "<leader>Fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Find All", nowait = true, remap = false },
  { "<leader>Fl", "<cmd> Telescope live_grep <CR>", desc = "Find Text", nowait = true, remap = false },
  { "<leader>Fb", "<cmd> Telescope buffers <CR>", desc = "Find Buffers", nowait = true, remap = false },
  { "<leader>Fh", "<cmd> Telescope help_tags <CR>", desc = "Help Page", nowait = true, remap = false },
  { "<leader>Fo", "<cmd> Telescope oldfiles <CR>", desc = "Find Old Files", nowait = true, remap = false },
  { "<leader>Fk", "<cmd> Telescope filetypes <CR>", desc = "Find Types", nowait = true, remap = false },
  { "<leader>Fc", "<cmd> Telescope current_buffer_fuzzy_find <CR>", desc = "Find in Current Buffer", nowait = true, remap = false },

  -- Git
  { "<leader>g", group = "Git", nowait = true, remap = false },
  { "<leader>gb", "<cmd> Telescope git_branches <CR>", desc = "Git branches", nowait = true, remap = false },
  { "<leader>gc", "<cmd> Telescope git_commits <CR>", desc = "Git commit", nowait = true, remap = false },
  { "<leader>gf", "<cmd> Telescope git_files <CR>", desc = "Git files", nowait = true, remap = false },
  { "<leader>gh", "<cmd> Telescope git_stash <CR>", desc = "Git stash", nowait = true, remap = false },
  { "<leader>gs", "<cmd> Telescope git_status <CR>", desc = "Git Status", nowait = true, remap = false },

	-- Buffer management using Barbar plugin
  { "<leader>B", group = "Buffer", nowait = true, remap = false },
  { "<leader>Bc", "<cmd> BufferCloseAllButCurrentOrPinned <CR>", desc = "Delete Picked Buffer", nowait = true, remap = false },
  { "<leader>Bd", "<cmd> BufferPickDelete <CR>", desc = "Delete Picked Buffer", nowait = true, remap = false },
  { "<leader>Bf", "<cmd> BufferFirst <CR>", desc = "Move to First Buffer", nowait = true, remap = false },
  { "<leader>Bi", "<cmd> BufferPick <CR>", desc = "Buffer Pick", nowait = true, remap = false },
  { "<leader>Bl", "<cmd> BufferLast <CR>", desc = "Move to Last Buffer", nowait = true, remap = false },
  { "<leader>Bp", "<cmd> BufferPin <CR>", desc = "Pin/Unpin Buffer", nowait = true, remap = false },
  { "<leader>Bs", "<cmd> BufferMoveStart <CR>", desc = "Move Buffer to Start", nowait = true, remap = false },
  { "<leader>Bt", "<cmd> BufferRestore <CR>", desc = "Restore Buffer", nowait = true, remap = false },
  -- Buffer Ordering
  { "<leader>Bo", group = "Order", nowait = true, remap = false },
  { "<leader>Bod", "<cmd> BufferOrderByDirectory <CR>", desc = "Order by Directory", nowait = true, remap = false },
  { "<leader>Bol", "<cmd> BufferOrderByLanguage <CR>", desc = "Order by Language", nowait = true, remap = false },
  { "<leader>Bon", "<cmd> BufferOrderByBufferNumber <CR>", desc = "Order by Buffer Number", nowait = true, remap = false },
  { "<leader>Bow", "<cmd> BufferOrderByWindowNumber <CR>", desc = "Order by Window Number", nowait = true, remap = false },

	-- Update/Install plugins and languages extensions
  { "<leader>s", group = "Update/Install", nowait = true, remap = false },
  -- For Lazy Plugin Manager
  { "<leader>sl", group = "Lazy - Plugin Manager", nowait = true, remap = false },
  { "<leader>slc", "<cmd> Lazy clean <CR>", desc = "Clean", nowait = true, remap = false },
  { "<leader>sle", "<cmd> Lazy health <CR>", desc = "Health", nowait = true, remap = false },
  { "<leader>slh", "<cmd> Lazy help <CR>", desc = "Help", nowait = true, remap = false },
  { "<leader>slk", "<cmd> Lazy check <CR>", desc = "Check", nowait = true, remap = false },
  { "<leader>sll", "<cmd> Lazy log <CR>", desc = "Log", nowait = true, remap = false },
  { "<leader>slr", "<cmd> Lazy reload <CR>", desc = "Reload", nowait = true, remap = false },
  { "<leader>sls", "<cmd> Lazy sync <CR>", desc = "Sync", nowait = true, remap = false },
  { "<leader>slu", "<cmd> Lazy update <CR>", desc = "Update", nowait = true, remap = false },

  -- Setup Releated Keymappings
  { "<leader>z", group = "Setup Keys", nowait = true, remap = false },
  { "<leader>zt", "<cmd> Telescope colorscheme <CR>", desc = "Coloschemes", nowait = true, remap = false },
  { "<leader>zh", "<cmd> checkhealth <CR>", desc = "Checkhealth", nowait = true, remap = false },
}

wk.add(mappings)
