local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Short Hand Func --
local keymap = vim.api.nvim_set_keymap

-- Leader Key --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better Window Nav --
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
keymap("n", "<A-k>", "<C-w>k", opts)

-- Resize with Arrows --
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Better Lex --
keymap("n", "<leader>e", ":NeoTreeFocus<CR>", opts)
keymap("n", "<leader>x", ":NeoTreeClose<CR>", opts)

-- Outline --
keymap("n", "<leader>o", ":SymbolsOutline<CR>", opts)

-- Remove Control Z --
keymap("", "<C-z>", "<Nop", opts)

-- Telescope Binding --
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})

-- Insert --
-- Better Esc --
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Indent --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste Fix --
keymap("v", "p", '"_dP', opts)

-- Terminal Escape
keymap("t", "jk", "<C-\\><C-n>", opts)

