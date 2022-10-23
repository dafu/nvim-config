-- vim.o.laststatus=3
-- vim.o.cmdheight=1
vim.o.ls=3
vim.o.ch=1
vim.o.showcmd=false

-- vim.cmd('hi MsgArea ctermfg=239 guifg=#434c5e')
-- vim.cmd('hi MoreMsg ctermfg=239 guifg=#434c5e')
-- vim.cmd('hi ModeMsg ctermfg=239 guifg=#434c5e')

-- vim.cmd('hi Visual cterm=NONE ctermbg=cyan   ctermfg=black')
-- vim.cmd('hi Search cterm=NONE ctermbg=yellow ctermfg=black')

vim.o.statusline=[[%#Normal#%{(mode()=='n')?'N':''}%{(mode()=='i')?'I':''}%{(mode()=='r')?'R':''}%{(mode()=='v')?'V':''} %f %(%M%R%)]]
vim.o.rulerformat=[[%70(%=%f %m%h%r%)]]
vim.o.ruler=false
