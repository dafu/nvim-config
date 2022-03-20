vim.fn.setenv('FZF_DEFAULT_COMMAND', 'rg --files --smart-case .')
vim.g.fzf_layout = { down= '30%' }
vim.g.fzf_colors = { fg=      {'fg', 'Normal'},
                     bg=      {'bg', 'Normal'},
                     hl=      {'fg', 'Normal'},
                     ['fg+'] =     {'fg', 'CursorLine', 'CursorColumn', 'Normal'},
                     ['bg+'] =     {'bg', 'CursorLine', 'CursorColumn'},
                     ['hl+'] =     {'fg', 'Normal'},
                     info=    {'fg', 'PreProc'},
                     border=  {'fg', 'Ignore'},
                     prompt=  {'fg', 'Conditional'},
                     pointer= {'fg', 'Exception'},
                     marker=  {'fg', 'Keyword'},
                     spinner= {'fg', 'Label'},
                     header=  {'fg', 'Comment'} }
vim.cmd("hi fzf2 guifg=yellow ctermfg=yellow guibg=blue ctermbg=blue")
