-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local cmd = vim.cmd

-- disable automatic comment wrapping and insertion of comment leaders
cmd("autocmd BufEnter * silent! set formatoptions-=cro")
cmd("autocmd BufEnter * silent! setlocal formatoptions-=cro")

-- remember fold
-- cmd("autocmd BufWinLeave * silent! mkview")
-- cmd("autocmd BufWinEnter * silent! loadview")

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.api.nvim_buf_set_keymap(
--       0,
--       "n",
--       "<F5>",
--       ":w<CR>:split<CR>:te time python %<CR> i",
--       { silent = true, noremap = true }
--     )
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "cpp",
--   callback = function()
--     vim.api.nvim_buf_set_keymap(
--       0,
--       "n",
--       "<F5>",
--       "<ESC>:w<CR>:split<CR>:te g++ -g -std=c++11 -Wshadow -Wall -Wextra % -o %<.out && time ./%<.out<CR> i",
--       -- "<ESC>:w<CR>:split<CR>:te g++ -g -std=c++11 -Wshadow -Wall -Wextra % -o %<.out && time ./%<.out < ./%<.in<CR>",
--       -- "<ESC>:w<CR>:split<CR>:te g++ -g -std=c++11 -Wshadow -Wall -Wextra % -o %<.out && gdb %<.out<CR>",
--       { silent = true, noremap = true }
--     )
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "java",
--   callback = function()
--     vim.api.nvim_buf_set_keymap(
--       0,
--       "n",
--       "<F5>",
--       "<ESC>:w<CR>:split<CR>:te javac % && java %< <CR> i",
--       { silent = true, noremap = true }
--     )
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "rust",
--   callback = function()
--     vim.api.nvim_buf_set_keymap(
--       0,
--       "n",
--       "<F5>",
--       "<ESC>:w<CR>:split<CR>:te cargo run %<CR>i",
--       { silent = true, noremap = true }
--     )
--   end,
-- })

-- Float window for Show line diagnostics automatically in hover window
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Set 'shiftwidth = 2' for lua file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

-- Set 'shiftwidth = 4' for c/c++ file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})
