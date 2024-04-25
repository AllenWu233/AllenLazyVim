-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local o = vim.o
local g = vim.g

-- encodeing
-- opt.encoding = "utf-8"
-- opt.fileencoding = "utf-8"
opt.fileencodings = { "utf-8", "ucs-bom", "gb18030", "gbk", "gb2312", "cp936" }

-- line number
-- opt.relativenumber = true
-- opt.number = true

-- indent
opt.tabstop = 4
opt.shiftwidth = 4
-- opt.expandtab = true -- tab 2 space
-- opt.autoindent = true
-- opt.smartindent = true

-- opt.wrap = true

-- display lines with a line break
-- opt.cursorline = true

-- keep space when moving cursor
-- opt.scrolloff = 8
opt.scrolloff = 999
-- opt.sidescrolloff = 8

-- opt.mouse:append("a")

-- opt.clipboard:append("unnamedplus")

-- new window in right and below
-- opt.splitright = true
-- opt.splitbelow = true

-- search
-- opt.ignorecase = true
-- opt.smartcase = true

-- opt.autoread = true
--
-- time wait for typing shortcut keys
-- opt.timeoutlen = 400
--
-- opt.signcolumn = "yes"

-- opt.showmode = false
--
-- opt.colorcolumn = "80"

-- show invisible characters
-- opt.list = true
-- opt.listchars = "space:·"

-- opt.showtabline = 2
--
-- opt.wildmenu = true
-- opt.pumheight = 10

g.autoformat = false
