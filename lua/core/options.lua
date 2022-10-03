vim.o.completeopt='menuone,noinsert,noselect'

vim.fn.setenv('LANG','en_US.UTF-8')
-- vim.cmd([[let $LANG='en_US.UTF-8']])
--  Options:
-- cmd 'syntax on'
vim.o.undofile=true
-- opt.undodir=[[$HOME/.cache/vim/undo]]
-- opt.viminfo=[['10,\"100,:20,%,n$HOME/.cache/vim/viminfo]]
vim.g.syntax=false
-- cmd 'hi VertSplit ctermbg=0'
vim.o.conceallevel=2
-- set t_Co=256
vim.o.termguicolors = true

-- let g:vim_markdown_folding_disabled = 1

-- filetype plugin indent on
vim.g.mapleader = ','
vim.o.signcolumn="yes"
vim.wo.number=true
vim.o.autoindent=true
vim.bo.autoindent=true
-- o.autoread="on"
vim.o.backspace='indent,eol,start'
vim.o.backup=false
-- g.complete-=i
-- set display+=lastline
vim.o.encoding='UTF-8'
vim.o.expandtab=true
vim.bo.expandtab=true
vim.o.hidden=true
vim.o.history=1000
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.inccommand='nosplit'
vim.o.incsearch=true
vim.g.lazyredraw=true
vim.o.list=true
-- o.listchars='extends:›,precedes:‹,nbsp:·,eol:\ ,tab:⍿\ ,trail:×'
-- g.matchpairs+=<:>

vim.o.mouse='a'
-- vim.o.autochdir=true
vim.o.modeline=true

-- wrap this in a toggle command
-- wo.number = true
-- wo.numberwidth = 3
-- wo.relativenumber = true
-- wo.signcolumn = "yes"
-- wo.cursorline = true

vim.o.showcmd=true 
vim.o.showmode=false
vim.o.spell=false
vim.o.startofline=false

vim.wo.wrap = false
vim.bo.textwidth = 300
vim.bo.formatoptions = "qrn1"

vim.o.shortmess=[[casItToOF]]
vim.o.showmatch=true

vim.o.smarttab=true
vim.o.softtabstop=2
vim.bo.softtabstop=2
vim.o.tabstop=2
vim.bo.tabstop=2
vim.o.shiftwidth=2
vim.bo.shiftwidth=2

vim.o.splitright=true
vim.o.splitbelow=true

vim.o.timeoutlen = 500
vim.o.updatetime = 100
vim.g.ttyfast = true
vim.o.scrolloff = 8

vim.o.whichwrap=[[b,s,<,>,[,]]
vim.o.titlestring=[[nvim\ %{&modified?'•':':'}\ %t]]
vim.o.clipboard=[[unnamed,unnamedplus]]

vim.o.wildmenu = true
vim.o.wildcharm = 9
vim.o.wildignorecase = true

vim.o.formatoptions = string.gsub(vim.o.formatoptions, 'a', '') -- - 'a'     -- Auto formatting is BAD.
vim.o.formatoptions = string.gsub(vim.o.formatoptions, 't', '') -- - 't'     -- Don't auto format my code. I got linters for that.
vim.o.formatoptions = string.gsub(vim.o.formatoptions, '2', '') -- - '2'     -- I'm not in gradeschool anymore
vim.o.formatoptions = string.gsub(vim.o.formatoptions, 'o', '') -- - 'o'     -- O and o, don't continue comments
vim.o.formatoptions = vim.o.formatoptions .. 'c'                -- + 'c'     -- In general, I like it when comments respect textwidth
vim.o.formatoptions = vim.o.formatoptions .. 'q'                -- + 'q'     -- Allow formatting comments w/ gq
vim.o.formatoptions = vim.o.formatoptions .. 'r'                -- + 'r'     -- But do continue when pressing enter.
vim.o.formatoptions = vim.o.formatoptions .. 'n'                -- + 'n'     -- Indent past the formatlistpat, not underneath it.
vim.o.formatoptions = vim.o.formatoptions .. 'j'                -- + 'j'     -- Auto-remove comments if possible.

-- set joinspaces
vim.o.joinspaces = false         -- Two spaces
