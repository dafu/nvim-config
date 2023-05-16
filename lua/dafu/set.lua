-- vim.o.completeopt='menuone,noselect'
vim.fn.setenv('LANG','en_US.UTF-8')
-- vim.o.undofile=true
-- opt.undodir=[[$HOME/.cache/vim/undo]]
-- opt.viminfo=[['10,\"100,:20,%,n$HOME/.cache/vim/viminfo]]
vim.g.syntax=false
-- cmd 'hi VertSplit ctermbg=0'
vim.o.conceallevel=2
-- vim.o.termguicolors = true
vim.g.mapleader = ','
vim.o.signcolumn="yes"
vim.wo.number=true
-- vim.o.autoindent=true
-- vim.bo.autoindent=true
vim.o.expandtab=true
vim.bo.expandtab=true
-- vim.o.smarttab=true
vim.o.softtabstop=2
vim.bo.softtabstop=2
vim.o.tabstop=2
vim.bo.tabstop=2
vim.o.shiftwidth=2
vim.bo.shiftwidth=2
-- vim.o.backspace='indent,eol,start'
-- vim.o.backup=false
-- vim.o.encoding='UTF-8'
-- vim.o.hidden=true
-- vim.o.history=200
-- vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.inccommand='split'
-- vim.o.incsearch=true
-- vim.g.lazyredraw=true -- only meant to be set temporarly
-- vim.o.list=true
-- o.listchars='extends:›,precedes:‹,nbsp:·,eol:\ ,tab:⍿\ ,trail:×'
-- g.matchpairs+=<:>

-- vim.o.mouse='a'
-- vim.o.autochdir=true
-- vim.o.modeline=true

-- wrap this in a toggle command
-- wo.number = true
-- wo.numberwidth = 3
vim.o.relativenumber = true
-- vim.o.showcmd=true 
vim.o.showmode=false
-- vim.o.spell=false
-- vim.o.startofline=false

vim.wo.wrap = false
vim.bo.textwidth = 300
vim.bo.formatoptions = "qrn1"

-- vim.o.shortmess=[[casItToOF]]
vim.o.showmatch=true


vim.o.splitright=true
vim.o.splitbelow=true

-- vim.o.timeoutlen = 500
vim.o.updatetime = 100
-- vim.g.ttyfast = true
vim.o.scrolloff = 8

vim.o.whichwrap=[[b,s,<,>,[,]]
vim.o.titlestring=[[nvim\ %{&modified?'•':':'}\ %t]]
vim.o.clipboard=[[unnamed,unnamedplus]]

-- vim.o.wildmenu = true
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
-- vim.o.joinspaces = false         -- Two spaces



vim.g.loaded_2html_plugin = false
vim.g.loaded_getscript = false
vim.g.loaded_getscriptPlugin = false
vim.g.loaded_gzip = false
vim.g.loaded_logipat = false
-- vim.g.loaded_netrwFileHandlers = false
-- vim.g.loaded_netrwPlugin = false
-- vim.g.loaded_netrwSettngs = false
vim.g.loaded_remote_plugins = false
vim.g.loaded_tar = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zip = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_vimball = false
vim.g.loaded_vimballPlugin = false
vim.g.zipPlugin = false

-- Custom Statusline
-- vim.o.laststatus=3
-- vim.o.cmdheight=1
vim.o.ls=3
vim.o.ch=1
vim.o.showcmd=true

-- vim.cmd('hi MsgArea ctermfg=239 guifg=#434c5e')
-- vim.cmd('hi MoreMsg ctermfg=239 guifg=#434c5e')
-- vim.cmd('hi ModeMsg ctermfg=239 guifg=#434c5e')

-- vim.cmd('hi Visual cterm=NONE ctermbg=cyan   ctermfg=black')
-- vim.cmd('hi Search cterm=NONE ctermbg=yellow ctermfg=black')

  vim.cmd([[highlight FoldColumn cterm=NONE ctermfg=none ctermbg=none guifg=grey guibg=none ]])

vim.o.statusline=[[%#Normal#%{(mode()=='n')?'N':''}%{(mode()=='i')?'I':''}%{(mode()=='r')?'R':''}%{(mode()=='v')?'V':''} %f %(%M%R%)]]
-- vim.o.rulerformat=[[%70(%=%f %m%h%r%)]]
-- vim.o.ruler=false

-- vim.o.foldcolumn = '2'
-- vim.o.foldlevel = 2
-- vim.o.foldlevelstart = 2
-- vim.o.foldenable = false
-- -- vim.o.foldmethod = "indent"
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- vim.api.nvim_create_autocmd({"ColorScheme", "VimEnter"}, {
--   pattern = {"*"},
  
--   callback = function()
--     vim.cmd([[highlight FoldColumn cterm=NONE ctermfg=none ctermbg=none guifg=grey guibg=none ]])
--     vim.cmd([[highlight Fold cterm=NONE ctermfg=none ctermbg=none guifg=grey guibg=none ]])
--     vim.cmd([[highlight Folded cterm=NONE ctermfg=none ctermbg=none guifg=grey guibg=none ]])
--   end,
-- })

local termGrp = vim.api.nvim_create_augroup("buf_pre", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.svelte"},
  buffer = buffer,
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
  group = buf_pre,
}) 

local termGrp = vim.api.nvim_create_augroup("terminal_job", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { command = "startinsert", group = termGrp, })
vim.api.nvim_create_autocmd("TermOpen", { command = "setlocal listchars= nonumber norelativenumber", group = termGrp, })
vim.api.nvim_create_autocmd("TermOpen", { command = "setlocal signcolumn=no foldcolumn=0 statuscolumn= listchars= nonumber norelativenumber", group = termGrp, })
-- vim.api.nvim_create_autocmd("TermOpen", { command = "setlocal signcolumn=no foldcolumn=0 statuscolumn=0 statusline=%{b:term_title} listchars= nonumber norelativenumber", group = termGrp, })
vim.api.nvim_create_autocmd("TermOpen", { command = [[tnoremap <C-w> <C-\><C-n><C-w>]], group = termGrp, })
vim.api.nvim_create_autocmd("TermOpen", { command = [[tnoremap <silent> <C-[><C-[> <C-\><C-n>]], group = termGrp, })
