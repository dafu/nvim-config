-- move lines
-- TODO fix:
vim.api.nvim_set_keymap('', '<PageDown>', '<nop>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<PageUp>' ,'<nop>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<C-Down>', ':m >+1<CR>gv=gv', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<C-Up>' ,':m <-2<CR>gv=gv', { noremap = true, silent = true})
--  Disable cmd history - use : & ctrl+f instead
vim.api.nvim_set_keymap('', 'q:', '<nop>', { noremap = true, silent = true})
-- SELECTION
vim.api.nvim_set_keymap('v', '//', 'y/<C-R>"<CR>', { noremap = true, silent = true})
-- indent
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true})
--  backspace in Visual mode deletes selection
vim.api.nvim_set_keymap('v', '<BS>', 'd', { noremap = true, silent = true})
-- Jumplist
vim.api.nvim_set_keymap('', '<S-Tab>', '<C-O>', { noremap = true, silent = true})
-- paste
vim.api.nvim_set_keymap('i', '<C-V>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-V>', '"+P', { noremap = true, silent = true})
--
vim.api.nvim_set_keymap('', '<C-N>', ':bnext<CR>run', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<C-P>', ':bprev<CR>', { noremap = true, silent = true})
--  paste over selection without poulluting the register
vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true, silent = true})

vim.api.nvim_set_keymap('', 'gW', '<cmd>exec "grep! -wF -- "..shellescape(expand("<cWORD>"), 1) <cr>', { noremap = true, silent = false})

-- map('', '<silent> <C-L>', ':nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>')

-- LEADER
-- leader overrides
vim.api.nvim_set_keymap('', '<leader>cd', ':lcd %:p:h', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>dd', '"_dd', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>dp', '"_ddp', { noremap = true, silent = true})
--
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>w', ':w<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>w', ':w<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>q', ':wq<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>d', ':bd<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>t', ':tabnew<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>c', ':tabclose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>s', ':new<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader><leader>v', ':vnew<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>wq', ':wq<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>q', ':q<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>Q', ':q!<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>bd', ':bd<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>cd', ':cd %:h<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>co', ':copen<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>cc', ':cclose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>so', ':so $MYVIMRC<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>y', [[<Cmd> %y+<CR>]], { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<leader>y', 'mpggVG"+y`p', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>gp', ':Gpull', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>gh', ':GitGutterPreviewHunk<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>aw', ':autocmd InsertLeave <buffer> write<CR> :echo "autosave active"<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>md', ':MarkdownPreview<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>b', ':b<space><TAB>', { noremap = true, silent = true})
--  encryption using filters
vim.api.nvim_set_keymap('v', [[<leader>mr]], [[:'<,'>!gpg -ear<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', [[<leader>me]], [[:'<,'>!gpg -ac<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', [[<leader>md]], [[:'<,'>!gpg -q -d<CR>]], { noremap = true, silent = true})
--
vim.api.nvim_set_keymap('', '<leader>nn', ':set number!<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>nr', ':set relativenumber!<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>tt', ':tabnew<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>ts', ':tabnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile buflisted<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>tp', ':tabnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile buflisted<CR>"*p', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>v', ':e $MYVIMRC<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<silent><leader>untab', [[:%s/\t/\r/g<CR>]], { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<silent><leader>totab', [[:%s/\n/\t/g<CR>]], { noremap = true, silent = true})
--  change next word and repeat with .
vim.api.nvim_set_keymap('', '<leader>cw', '*``cgn', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>ee', ':silent !start explorer %:p:h<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>ec', ':silent !start powershell -noexit -command "cd %:p:h"<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>ev', ':silent !code %<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>tt]], [[:terminal<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>tz]], [[:vsplit term://%:p:h//mksh<CR>]] , { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<leader>ec', ':silent !term<CR>', { noremap = true, silent = true})

-- Regexes
vim.api.nvim_set_keymap('',   [[<leader>e"]], [[:Equote<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e']], [[:Esquote<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e,]], [[:Ecomma<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>ew]], [[:luado MiniTrailspace.trim()<CR>]] , { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   [[<leader>e",]], [[:%s/\(.*\)/"\1",/g<CR>]] , { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   [[<leader>e',]], [[:%s/\(.*\)/'\1',/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e,]], [[:%s/\(.*\)/\1,/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>es]], [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>dash]], [[:%s/val_.*,/val_,/g <Bar> let i=1 <Bar> g/val_/s//\='val_'.i/ <Bar> let i=i+1<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>eu]], [[:Euntab<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>et]], [[:Etotab<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>ex]], [[:%s/.*`\(.*\)`.*/\1/g<CR>]] , { noremap = true, silent = true})

vim.api.nvim_create_user_command('Equote',  [[execute '%s/^.\+$/"&"/g']], {})
vim.api.nvim_create_user_command('Esquote', [[execute '%s/^.\+$/''&''/g']], {})
vim.api.nvim_create_user_command('Ereverse', [[execute 'g/^/m0']], {})
vim.api.nvim_create_user_command('Euntab', [[execute :%s/\t/\r/g<CR>]], {})
vim.api.nvim_create_user_command('Etotab', [[execute :%s/\n/\t/g<CR>]], {})
-- vim.api.nvim_create_user_command('Idin', [[execute '%s/^.\+$/''&''/g' | ]], {})
-- vim.api.nvim_create_user_command('IdIn', [[execute '%s/\(.*\)/"\1"/g']], {})

-- vim.api.nvim_set_keymap('', [[<leader>ct", ':lua require"timer".update_ts()<cr>]], {noremap = true, silent = true})

-- " nnoremap <silent> <leader>leitfaden :g!/^Frage\s[0-9]\|^0\s/d <CR>
-- " <bar> %s/\s\+$//g <bar> %s/\s\+/\s/g <bar> %s/weiter//g <bar> %s/mit//g <bar> %s/^Fra.*/\|&\|/<CR>
-- " <bar> let @q='/0\<CR>/^\|Frage\<CR><C-r>eyf\|/0<CR>viw\<C-r>epa--\<ESC>' <bar> %norm @q
-- " nnoremap <silent> <leader>leitfaden :g!/^Frage [0-9]\|^0 /d <bar> %s/://g <bar> %s/\ $//g <bar> %s/\ \ / /g <bar> %s/weiter//g <bar> %s/mit//g <bar> %s/->/-->/ <bar> %s/^Fra.*/\|&\|/ <bar> let @q='/0<CR>Frage<CR>"eyf|/<CR>viw"epa -- <ESC>' <bar> %norm @q
--
-- FZF
-- vim.api.nvim_set_keymap('', '<C-o>', [[:Files<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-O>', [[:FZFMru<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-Tab>', [[:Marks<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-j><c-o>', [[:Files %:h:p<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-k><c-o>', [[:Files ~<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-k><c-g>', [[:GFiles<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-k><c-h>', [[:FZFMru<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-b>', [[:Buffers<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-f>', [[:Lines<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<C-k><c-f>', [[:BLines<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-o>        ', ':Files<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-O>        ', ':FZFMru<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-Tab>      ', ':Marks<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-j><c-o>   ', ':Files         %:h:p<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-k><c-o>   ', ':Files         ~<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-k><c-g>   ', ':GFiles<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-k><c-h>   ', ':FZFMru<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-b>        ', ':Buffers<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-f>        ', ':Lines<cr>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   '<C-k><c-f>   ', ':BLines<cr>', { noremap = true, silent = true})

--  Search selected text
-- vim.api.nvim_set_keymap('', '<SPACE>', '<c-d>', { silent = true})
-- vim.api.nvim_set_keymap('', '<Shift><SPACE>', '<c-u>', { silent = true})
-- map <F1> <Esc>
-- map('i', <F1> <Esc>
-- inoremap <C-U> <C-G>u<C-U>
-- map('', <silent> <PageUp> <C-U><C-U>
-- vnoremap <silent> <PageUp> <C-U><C-U>
-- inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>
-- map('', <silent> <PageDown> <C-D><C-D>
-- vnoremap <silent> <PageDown> <C-D><C-D>
-- inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

-- remove
-- arrow keys
-- vim.api.nvim_set_keymap('','<S-Up>','<Esc>v<Up>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Down>','<Esc>v<Down>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Left>','<Esc>v<Left>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Right>','<Esc>v<Right>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Up>','v<Up>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Down>','v<Down>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Left>','v<Left>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('','<S-Right>','v<Right>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v','<S-Up>','<Up>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v','<S-Down>','<Down>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v','<S-Left>','<Left>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v','<S-Right>','<Right>', { noremap = true, silent = true})

-- NVIM TREE AUTOGEN
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--
