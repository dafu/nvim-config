-- Options

-- LANG
vim.fn.setenv("LANG", "en_US.UTF-8")

-- mapleader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- rg as default grep
vim.o.grepprg = [[rg --vimgrep --hidden -g "!.git"]]

-- overrides for mini basics
vim.opt.shortmess:append("I") -- skip Intro
vim.o.backspace = "indent,eol,start" -- allow backspace
vim.o.whichwrap = [[b,s,<,>,[,]] -- allow keys to cross eol
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.o.cursorline = false

vim.o.clipboard = [[unnamed,unnamedplus]]
vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Make line numbers default
vim.opt.relativenumber = true
-- vim.opt.number = true

-- transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
