-- lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)

-- set mapleader before lazy
vim.g.mapleader = ' '
-- disable for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Lazy 
require("lazy").setup('plugins')

-- own stuff
require("dafu")
vim.o.grepprg = [[rg --vimgrep --hidden -g "!.git"]]
vim.api.nvim_set_keymap('n', '<leader>/', ':silent grep ', { silent = false })

-- overrides for mini basics
vim.opt.shortmess:append('I') -- skip Intro
vim.o.backspace = 'indent,eol,start' -- allow backspace
vim.o.whichwrap = [[b,s,<,>,[,]] -- allow keys to cross eol
vim.o.expandtab = true
-- vim.o.smarttab=true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
