-- DISABLE
-- disable PageDown / PageUp
vim.api.nvim_set_keymap('', '<PageDown>', '<nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<PageUp>', '<nop>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<C-Down>', ':m >+1<CR>gv=gv', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<C-Up>' ,':m <-2<CR>gv=gv', { noremap = true, silent = true})
--  Disable cmd history - use : & ctrl+f instead
vim.api.nvim_set_keymap('', 'q:', '<nop>', { noremap = true, silent = true })

-- SELECTION
vim.api.nvim_set_keymap('v', '//', 'y/<C-R>"<CR>', { noremap = true, silent = true })
-- indent
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
--  backspace in Visual mode deletes selection
vim.api.nvim_set_keymap('v', '<BS>', 'd', { noremap = true, silent = true })

-- JUMPLIST
vim.api.nvim_set_keymap('', '<S-Tab>', '<C-O>', { noremap = true, silent = true })

-- COPYPASTE
vim.api.nvim_set_keymap('i', '<C-V>', '<C-R>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('', '<C-V>', '"+P', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<C-N>', ':bnext<CR>run', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-P>', ':bprev<CR>', { noremap = true, silent = true })
--  paste over selection without poulluting the register
vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true, silent = true })

-- QUICKFIX
-- grep current word to QUICKFIX
vim.api.nvim_set_keymap('', 'gW', '<cmd>exec "grep! -wF -- "..shellescape(expand("<cWORD>"), 1) <cr>', { noremap = true, silent = false })

-- map('', '<silent> <C-L>', ':nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>')

-- LSP
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- PLUGINS
vim.api.nvim_set_keymap('', [[<leader>ew]], [[:luado MiniTrailspace.trim()<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('', '<leader>gp', ':Gpull', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<leader>gh', ':GitGutterPreviewHunk<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<leader>md', ':MarkdownPreview<CR>', { noremap = true, silent = true})

-- LEADER
-- leader overrides
vim.api.nvim_set_keymap('', '<leader>cd', ':lcd %:p:h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>dd', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>dp', '"_ddp', { noremap = true, silent = true })
--
vim.api.nvim_set_keymap('', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>q', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>d', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>t', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>c', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>s', ':new<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader><leader>v', ':vnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>wq', ':wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>Q', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>cd', ':cd %:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>co', ':copen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>cc', ':cclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>so', ':so $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>y', [[<Cmd> %y+<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('', '<leader>y', 'mpggVG"+y`p', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<leader>aw', ':autocmd InsertLeave <buffer> write<CR> :echo "autosave active"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>b', ':b<space><TAB>', { noremap = true, silent = true })
--  encryption using filters
vim.api.nvim_set_keymap('v', [[<leader>mr]], [[:'<,'>!gpg -ear<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', [[<leader>me]], [[:'<,'>!gpg -ac<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', [[<leader>md]], [[:'<,'>!gpg -q -d<CR>]], { noremap = true, silent = true })
--
vim.api.nvim_set_keymap('', '<leader>nn', ':set number!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>nr', ':set relativenumber!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>tt', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>ts', ':tabnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile buflisted<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>tp', ':tabnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile buflisted<CR>"*p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>v', ':e $MYVIMRC<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('', '<silent><leader>untab', [[:%s/\t/\r/g<CR>]], { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', '<silent><leader>totab', [[:%s/\n/\t/g<CR>]], { noremap = true, silent = true})
--  change next word and repeat with .
vim.api.nvim_set_keymap('', '<leader>cw', '*``cgn', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>ee', ':silent !start explorer %:p:h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>ec', ':silent !start powershell -noexit -command "cd %:p:h"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<leader>ev', ':silent !code %<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>tt]], [[:terminal<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>tz]], [[:vsplit term://%:p:h//mksh<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('', '<leader>ec', ':silent !term<CR>', { noremap = true, silent = true})

-- REGEXES
-- user commands
vim.api.nvim_create_user_command('Equote', [[execute '%s/^.\+$/"&"/g']], {})
vim.api.nvim_create_user_command('Esquote', [[execute '%s/^.\+$/''&''/g']], {})
vim.api.nvim_create_user_command('Ereverse', [[execute 'g/^/m0']], {})
vim.api.nvim_create_user_command('Euntab', [[execute :%s/\t/\r/g<CR>]], {})
vim.api.nvim_create_user_command('Etotab', [[execute :%s/\n/\t/g<CR>]], {})
vim.api.nvim_create_user_command('Idin', [[execute '%s/^.\+$/''&''/g' | ]], {})
vim.api.nvim_create_user_command('IdIn', [[execute '%s/\(.*\)/"\1"/g']], {})
-- regex keys
vim.api.nvim_set_keymap('', [[<leader>e"]], [[:Equote<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>e']], [[:Esquote<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>e,]], [[:Ecomma<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('',   [[<leader>e",]], [[:%s/\(.*\)/"\1",/g<CR>]] , { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('',   [[<leader>e',]], [[:%s/\(.*\)/'\1',/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('', [[<leader>e,]], [[:%s/\(.*\)/\1,/g<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>es]], [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  '',
  [[<leader>dash]],
  [[:%s/val_.*,/val_,/g <Bar> let i=1 <Bar> g/val_/s//\='val_'.i/ <Bar> let i=i+1<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap('', [[<leader>eu]], [[:Euntab<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>et]], [[:Etotab<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('', [[<leader>ex]], [[:%s/.*`\(.*\)`.*/\1/g<CR>]], { noremap = true, silent = true })

-- TIMER
-- vim.api.nvim_set_keymap('', [[<leader>ct", ':lua require"timer".update_ts()<cr>]], {noremap = true, silent = true})

-- WORK
-- " nnoremap <silent> <leader>leitfaden :g!/^Frage\s[0-9]\|^0\s/d <CR>
-- " <bar> %s/\s\+$//g <bar> %s/\s\+/\s/g <bar> %s/weiter//g <bar> %s/mit//g <bar> %s/^Fra.*/\|&\|/<CR>
-- " <bar> let @q='/0\<CR>/^\|Frage\<CR><C-r>eyf\|/0<CR>viw\<C-r>epa--\<ESC>' <bar> %norm @q
-- " nnoremap <silent> <leader>leitfaden :g!/^Frage [0-9]\|^0 /d <bar> %s/://g <bar> %s/\ $//g <bar> %s/\ \ / /g <bar> %s/weiter//g <bar> %s/mit//g <bar> %s/->/-->/ <bar> %s/^Fra.*/\|&\|/ <bar> let @q='/0<CR>Frage<CR>"eyf|/<CR>viw"epa -- <ESC>' <bar> %norm @q
--

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
-- vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
