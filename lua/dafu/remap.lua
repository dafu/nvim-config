-- move lines
-- @TODO fix: 
-- vim.api.nvim_set_keymap('v', '<C-Down>', ':m >+1<CR>gv=gv', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<C-Up>' ,':m <-2<CR>gv=gv', { noremap = true, silent = true})
--  Disable cmd history
vim.api.nvim_set_keymap('', 'q:', '<nop>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('', 'Q', '<nop>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', 'Q', ':History:<cr>', { noremap = true, silent = true})
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
-- vim.api.nvim_set_keymap('', '<leader>ec', ':silent !term<CR>', { noremap = true, silent = true})

-- Regexes
vim.api.nvim_set_keymap('',   [[<leader>e"]], [[:Quote<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e']], [[:Squote<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e",]], [[:%s/\(.*\)/"\1",/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e',]], [[:%s/\(.*\)/'\1',/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>e,]], [[:%s/\(.*\)/\1,/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>es]], [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>dash]], [[:%s/val_.*,/val_,/g <Bar> let i=1 <Bar> g/val_/s//\='val_'.i/ <Bar> let i=i+1<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>untab]], [[:%s/\t/\r/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>totab]], [[:%s/\n/\t/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>ex]], [[:%s/.*`\(.*\)`.*/\1/g<CR>]] , { noremap = true, silent = true})
vim.api.nvim_set_keymap('',   [[<leader>et]], [[:terminal<CR>]] , { noremap = true, silent = true})

vim.api.nvim_create_user_command('Quote',  [[execute '%s/^.\+$/"&"/g']], {})
vim.api.nvim_create_user_command('Squote', [[execute '%s/^.\+$/''&''/g']], {})
vim.api.nvim_create_user_command('Reverse', [[execute 'g/^/m0']], {})
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

local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))

end
