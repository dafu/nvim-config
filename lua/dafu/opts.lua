-- Options

-- LANG
vim.fn.setenv("LANG", "en_US")
vim.cmd("language en_US")

-- General
vim.o.undofile = true -- Enable persistent undo (see also `:h undodir`)
vim.o.backup = false -- Don't store backup while overwriting the file
vim.o.writebackup = false -- Don't store backup while overwriting the file
vim.o.mouse = "a" -- Enable mouse for all available modes
vim.cmd("filetype plugin indent on") -- Enable all filetype plugins
-- Enable syntax highlighting if it wasn't already (as it is time consuming)
if vim.fn.exists("syntax_on") ~= 1 then
	vim.cmd([[syntax enable]])
end

-- Appearance
vim.o.breakindent = false -- Indent wrapped lines to match line start
vim.o.cursorline = false -- Highlight current line
vim.o.linebreak = true -- Wrap long lines at 'breakat' (if 'wrap' is set)
vim.o.number = true -- Show line numbers
vim.o.splitbelow = true -- Horizontal splits will be below
vim.o.splitright = true -- Vertical splits will be to the right
vim.o.ruler = false -- Don't show cursor position in command line
vim.o.showmode = false -- Don't show mode in command line
vim.o.wrap = false -- Display long lines as just one line
vim.o.signcolumn = "yes" -- Always show sign column (otherwise it will shift text)
vim.o.fillchars = "eob: " -- Don't show `~` outside of buffer
vim.o.winborder = "rounded"
-- transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- Some opinioneted extra UI options
-- vim.o.pumblend = 10 -- Make builtin completion menus slightly transparent
vim.o.pumheight = 10 -- Make popup menu smaller
-- vim.o.winblend = 10 -- Make floating windows slightly transparent

vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣", extends = "…", precedes = "…" }
vim.opt.fillchars:append("vert:│,horiz:─,horizdown:┬,horizup:┴,verthoriz:┼,vertleft:┤,vertright:├")
-- Decrease update time
-- vim.o.updatetime = 250
-- Decrease mapped sequence wait time
-- vim.o.timeoutlen = 300

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = false

-- Make line numbers default
vim.opt.relativenumber = false
vim.opt.number = false

-- Editing
vim.o.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch = true -- Show search results while typing
vim.o.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.o.smartcase = true -- Don't ignore case when searching if pattern has upper case
vim.o.smartindent = true -- Make indenting smart

vim.o.completeopt = "menuone,noselect" -- Customize completions
vim.o.virtualedit = "block" -- Allow going past the end of line in visual block mode
vim.o.formatoptions = "qjl1" -- Don't autoformat comments
vim.opt.shortmess:append("Wc") -- Reduce command line messages

-- mapleader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- rg as default grep
vim.o.grepprg = [[rg --vimgrep --hidden -g "!.git"]]
vim.opt.grepformat = [[%f:%l:%c:%m]]

-- overrides for mini basics
vim.opt.shortmess:append("I") -- skip Intro
vim.o.backspace = "indent,eol,start" -- allow backspace
vim.o.whichwrap = [[b,s,<,>,[,]] -- allow keys to cross eol
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2

--  Schedule the setting after `UiEnter` because it can increase startup-time.
-- vim.o.clipboard = [[unnamed,unnamedplus]]
vim.schedule(function()
	vim.o.clipboard = "unnamed,unnamedplus"
end)
