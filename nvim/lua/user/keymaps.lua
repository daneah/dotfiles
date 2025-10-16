local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", ",", "<nop>", opts)
vim.g.mapleader = ","

keymap("n", ";", ":", {})
keymap("n", "<Leader>w", ":setlocal wrap!<CR>", opts)
keymap("n", "<Leader>l", ":setlocal number!<CR>", opts)
keymap("n", "<Leader>r", ":setlocal relativenumber!<CR>", opts)
keymap("n", "<space>", "/", opts)
keymap("n", "<Leader><space>", ":set hlsearch!<CR>", opts)
keymap("i", "<S-Tab>", "<C-o><<", opts)

-- File tree
keymap("n", "<Leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<Leader>ft", ":NvimTreeFocus<cr>", opts)
-- File tree

-- Prude mode
keymap("i", "<Up>", "<nop>", opts)
keymap("i", "<Down>", "<nop>", opts)
keymap("i", "<Left>", "<nop>", opts)
keymap("i", "<Right>", "<nop>", opts)
keymap("n", "<Up>", "<nop>", opts)
keymap("n", "<Down>", "<nop>", opts)
keymap("n", "<Left>", "<nop>", opts)
keymap("n", "<Right>", "<nop>", opts)
-- Prude mode

-- Movements
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
-- Movements

-- Splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Splits

-- Underlining
keymap("n", "<Leader>=", "yypv$r=", opts)
keymap("n", "<Leader>-", "yypv$r-", opts)
keymap("n", "<Leader>#", "yypv$r#", opts)
keymap("n", "<Leader>\"", "yypv$r\"", opts)
keymap("n", "<Leader>U", "yypv$r━", opts)
-- Underlining

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines
keymap("v", "J", ":move .+2<CR>gv-gv", opts)
keymap("v", "K", ":move .-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", "\"_dP", opts)
-- Move lines

-- Navigation
keymap("n", "<C-b>", ":lua vim.lsp.buf.definition()<cr>", opts)
-- Navigation

-- Diagnostics
keymap("n", "<Leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<Leader>xx", ":Trouble diagnostics toggle<CR>", opts)
-- Diagnostics
