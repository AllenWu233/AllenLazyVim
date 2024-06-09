-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })

-- disable automatic comment wrapping and insertion of comment leaders
-- cmd("autocmd BufEnter * silent! set formatoptions-=cro")
-- cmd("autocmd BufEnter * silent! setlocal formatoptions-=cro")

-- remember fold
-- cmd("autocmd BufWinLeave * silent! mkview")
-- cmd("autocmd BufWinEnter * silent! loadview")

autocmd("BufEnter", {
  command = "set formatoptions-=cro",
})

autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function()
    vim.cmd.mkview()
  end,
  group = save_fold,
})

autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    vim.cmd.loadview({ mods = { emsg_silent = true } })
  end,
  group = save_fold,
})

-- Float window for Show line diagnostics automatically in hover window
-- autocmd({ "CursorHold", "CursorHoldI" }, {
autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Set 'shiftwidth = 2' for lua file
autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
})

-- Set 'shiftwidth = 4' for c/c++ file
autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
  end,
})
