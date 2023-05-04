-- lazy bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
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

vim.o.clipboard=[[unnamed,unnamedplus]]

-- syntax highlight non ascii characters
vim.cmd[[syntax match nonascii "[^\x00-\x7F]"]]
vim.cmd[[highlight nonascii guifg=black guibg=darkyellow]]
-- ß
-- ßüö
vim.cmd([[
augroup nonascii
autocmd!
autocmd ColorScheme * highlight nonascii guifg=black guibg=darkyellow 
augroup end
]])

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

vim.cmd([[colorscheme tokyonight-night]])
