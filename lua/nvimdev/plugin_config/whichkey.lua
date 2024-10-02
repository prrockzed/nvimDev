local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local mappings = {
  { "<leader>N", "<cmd> enew <CR>", desc = "New buffer", nowait = true, remap = false },
  { "<leader>c", "<cmd> BufferClose <CR>", desc = "Close Buffer", nowait = true, remap = false },
  { "<leader>e", "<cmd> NvimTreeToggle<cr>", desc = "Nvim Tree Toggle", nowait = true, remap = false },
  { "<leader>q", "<cmd> q! <CR>", desc = "Quit", nowait = true, remap = false },
  { "<leader>w", "<cmd> w! <CR><CR>", desc = "Save", nowait = true, remap = false },

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
}

wk.add(mappings)
