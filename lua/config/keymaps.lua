local map = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")


-- Save and quit shortcuts
map("n", "<leader>w", ":w<CR>", { desc = "Save File"})
map("n", "<leader>qq", ":q<CR>", { desc = "Quit Buffer"})
map("n", "<leader>qa", ":qa!<CR>", { desc = "Quit All"})

map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv") -- Move selected lines up/down in visual mode

-- Better modes --
map("i", "jk", "<Esc>")
map("i", "kk", "<Esc>")
