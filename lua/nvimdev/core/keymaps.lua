-- Keymaps for Neovim
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Options for non-repetitive actions: noremap and silent
local opts = { noremap = true, silent = true }

-- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts) -- Move to left window
map("n", "<C-j>", "<C-w>j", opts) -- Move to window below
map("n", "<C-k>", "<C-w>k", opts) -- Move to window above
map("n", "<C-l>", "<C-w>l", opts) -- Move to right window

-- Resize windows with arrow keys
map("n", "<C-q>", ":resize -2<CR>", opts)
map("n", "<C-w>", ":resize +2<CR>", opts)
map("n", "<C-a>", ":vertical resize -2<CR>", opts)
map("n", "<C-s>", ":vertical resize +2<CR>", opts)

-- Navigate buffers (barbar.nvim)
map("n", "<S-l>", ":BufferNext<CR>", opts)
map("n", "<S-h>", ":BufferPrevious<CR>", opts)

-- Move Buffers
map("n", "<S-i>", ":BufferMoveNext<CR>", opts)
map("n", "<S-u>", ":BufferMovePrevious<CR>", opts)

-- Move text up and down
map("n", "<S-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<S-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Quick actions
map("n", "<Esc>", ":noh<CR>", opts) -- Clear highlights
map("n", "q", ":noh<CR>", opts) -- Clear highlights (if pressing 'q')
map("n", "<C-c>", "<cmd>%y+<CR>", opts) -- Copy entire file to clipboard
map("n", "d", '"_d', opts) -- Delete without yanking

-- Additional shortcuts
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts) -- Toggle File Explorer
map("n", "<leader>gd", ":Gitsigns diffthis<CR>", opts) -- Toggle Gitsigns Diff
map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts) -- Toggle Comments
map("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Open Telescope File Search

-- Insert Mode --
-- Press 'kj' quickly to exit insert mode
map("i", "kj", "<ESC>", opts)

-- Navigate in insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)

-- Move to start or end of the line in insert mode
map("i", "<C-b>", "<ESC>^i", opts) -- Move to beginning of line
map("i", "<C-e>", "<End>", opts) -- Move to end of line

-- Quick access to digraphs in insert mode
map("i", "<C-s>", "<C-k>", opts)

-- Visual Mode --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<S-j>", ":m '>+1<CR>gv-gv", opts)
map("v", "<S-k>", ":m '<-2<CR>gv-gv", opts)

-- Replace selected text
map("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', opts)

-- Paste without overwriting the register
map("v", "p", '"_dP', opts)

-- Visual Block Mode --
-- Move text up and down in visual block mode
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Terminal Mode --
-- Better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

