vim.cmd("iabbrev <buffer> ife$ if err != nil {<CR><Space>return<CR>}<Esc><Up>A")
vim.cmd("iabbrev <buffer> iff$ if err != nil {<CR><Space>log.Fatal(err)<CR>}<CR>")
