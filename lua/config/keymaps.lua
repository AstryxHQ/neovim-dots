local map = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Clear search highlight
map("n", "<leader>nh", ":nohl<CR>")

-- Save and quit shortcuts
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- Move selected lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Better modes --
map("i", "jk", "<Esc>")
map("i", "kk", "<Esc>")
