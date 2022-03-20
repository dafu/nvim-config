if vim.fn.has('nvim-0.7') == 1 then
  vim.opt.laststatus=3
else
  vim.o.laststatus=2
end

vim.o.cmdheight=1
vim.o.showcmd=false

vim.cmd('hi MsgArea ctermfg=239 guifg=#434c5e')
vim.cmd('hi MoreMsg ctermfg=239 guifg=#434c5e')
vim.cmd('hi ModeMsg ctermfg=239 guifg=#434c5e')

vim.o.statusline=[[%#NonText#%{(mode()=='n')?'N':''}%{(mode()=='i')?'I':''}%{(mode()=='r')?'R':''}%{(mode()=='v')?'V':''} %f %(%M%R%)]]
vim.o.rulerformat=[[%70(%=%f %m%h%r%)]]
vim.o.ruler=false
