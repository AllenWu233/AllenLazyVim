-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local k = vim.keymap

-- leader key
vim.g.mapleader = " "

-- ---------- INSERT mode ---------- --
k.set("i", "jk", "<ESC>")
k.set("i", "kj", "<ESC>")

-- ---------- VISUAL mode ---------- --
k.set("v", "jk", "<ESC>")
k.set("v", "kj", "<ESC>")

-- move one or more lines
k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("v", "K", ":m '<-2<CR>gv=gv")

-- indent left or right
-- k.set("v", ">", ">gv")
-- k.set("v", "<", "<gv")

-- fold
k.set("v", "<leader>f", "zf")

-- ---------- INSERT mode ---------- --
k.set("i", "<C-s>", "<ESC>:w<CR>") -- auto indent

-- ---------- NORMAL mode ---------- --
-- select all
k.set("n", "<C-A>", "ggVGy") -- copy
k.set("n", "<C-X>", "ggdG") -- delete
k.set("n", "<leader>=", "gg=G") -- auto indent

-- save
k.set("n", "<C-s>", "<ESC>:w<CR>")

-- window
-- k.set("n", "<leader>sh", "<C-w>v") -- add window horizontally
-- k.set("n", "<leader>sv", "<C-w>s") -- add window vertically
-- k.set("n", "<leader>sc", "<C-w>c") -- close current window
-- k.set("n", "<leader>so", "<C-w>o") -- close other window

-- move cursor
k.set("n", "<leader>j", "<C-w>j") -- move down
k.set("n", "<leader>k", "<C-w>k") -- move up
k.set("n", "<leader>h", "<C-w>h") -- move left
k.set("n", "<leader>l", "<C-w>l") -- move right
-- k.set("n", "<leader>w", "<C-w>w") -- move in a loop

k.set("n", "<leader>nh", ":nohl<CR>")

-- buffer
k.set("n", "J", ":bprevious<CR>")
k.set("n", "K", ":bnext<CR>")
k.set("n", "X", ":bdelete!<CR>")

-- fold or unfold
k.set("n", "<leader>a", "za")

-- ---------- plugins ---------- --
-- nvim-tree
-- k.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- colorizer
-- k.set("n", "<leader>ca", ":ColorizerAttachToBuffer<CR>")
-- k.set("n", "<leader>cd", ":ColorizerDetachFromBuffer<CR>")
-- k.set("n", "<leader>cr", ":ColorizerReloadAllBuffers<CR>")
