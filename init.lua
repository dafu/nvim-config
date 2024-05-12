-- lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath, })
end
vim.opt.rtp:prepend(lazypath)

-- set mapleader before lazy
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = ' '
-- disable for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Plugins
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

vim.o.cursorline = false

vim.o.clipboard = [[unnamed,unnamedplus]]

-- require('nord').set()
-- syntax highlight non ascii characters
vim.cmd [[syntax match xasciii '[^\x00-\x7F]']]
vim.cmd [[highlight xasciii guifg=black guibg=darkyellow]]
-- ß
-- ä
-- ßüö
vim.cmd([[
augroup xasciii
autocmd!
autocmd ColorScheme * highlight xasciii guifg=black guibg=darkyellow
augroup end
]])



require('custom.nonascii').setup({})
-- vim.cmd([[colorscheme tokyonight-night]])
--
--
--
if vim.g.neovide then
  vim.o.guifont                             = "JetBrainsMono NF:h9" -- text below applies for VimScript

  vim.opt.linespace                         = 0
  vim.g.neovide_scale_factor                = 1.0
  vim.g.neovide_cursor_animation_length     = 0
  vim.g.neovide_scroll_animation_length     = 0
  vim.g.neovide_transparency                = 0.97
  vim.g.neovide_remember_window_size        = true
  vim.g.neovide_scroll_animation_length     = 0
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_cursor_trail_size           = 0

  vim.keymap.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { silent = true, remap = false })
  vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { silent = true, remap = false })
  vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true, remap = false })
end
