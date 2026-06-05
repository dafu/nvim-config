-- stylua: ignore start
local nmap = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { desc = desc }) end
local nmap_leader = function(suffix, rhs, desc) vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc }) end
local xmap_leader = function(suffix, rhs, desc) vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc }) end

-- QUICKFIX
nmap_leader("ct", '<cmd>exec "silent grep! -wF -- TODO" | copen <cr>')
nmap_leader("cn", ":cnext<CR>")
nmap_leader("cp", ":cprevious<CR>")
nmap_leader("co", ":copen<CR>")
nmap_leader("cc", ":cclose<CR>")
nmap("gW", '<cmd>exec "silent grep! -wF -- "..shellescape(expand("<cWORD>"), 1) <cr>')

-- SELECTION
vim.api.nvim_set_keymap("v", "//", 'y/<C-R>"<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<",  "<gv",          { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">",  ">gv",          { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<BS>", "d",          { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "p",  '"_dP',         { noremap = true, silent = true })

-- NAVIGATION
nmap("q:", "<nop>")
nmap("<S-Tab>", "<C-O>")
nmap("<C-N>", ":bnext<CR>")
nmap("<C-P>", ":bprev<CR>")

-- LSP
-- nmap_leader("wf", "<cmd>Format<CR>")
nmap("[d",  vim.diagnostic.goto_prev,  "Go to previous diagnostic")
nmap("]d",  vim.diagnostic.goto_next,  "Go to next diagnostic")
nmap_leader("e",  vim.diagnostic.open_float, "Show diagnostic errors")
nmap_leader("le", vim.diagnostic.setloclist, "Diagnostics to loclist")
nmap_leader("ce", vim.diagnostic.setqflist,  "Diagnostics to quickfix")
nmap("gd",  vim.lsp.buf.definition,   "Go to definition")
nmap("grn", vim.lsp.buf.rename,       "Rename symbol")
nmap("K",   vim.lsp.buf.hover,        "Hover documentation")
nmap_leader("s", vim.lsp.buf.signature_help, "Signature help")

-- PLUGINS
nmap_leader("ew", [[:luado MiniTrailspace.trim()<CR>]])
nmap_leader("hh", [[:luado MiniDiff.toggle_overlay()<CR>]])

-- BUFFERS / FILES
nmap_leader("w",  ":w<CR>")
nmap_leader("ww",  ":w<CR>")
nmap_leader("wq", ":wq<CR>")
nmap_leader("q",  ":q<CR>")
nmap_leader("Q",  ":q!<CR>")
nmap_leader("bd", ":bd<CR>")
nmap_leader("cd", ":cd %:h<CR>")
nmap_leader("so", ":so $MYVIMRC<CR>")
-- nmap_leader("y",  [[<Cmd> %y+<CR>]])
nmap_leader("dd", '"_dd')
nmap_leader("dp", '"_ddp')
nmap_leader("cw", "*``cgn")
nmap_leader("nn", ":set number!<CR>")
nmap_leader("nr", ":set relativenumber!<CR>")

-- double-leader shortcuts
nmap_leader("<leader>w", ":w<CR>")
nmap_leader("<leader>q", ":wq<CR>")
nmap_leader("<leader>d", ":bd<CR>")
nmap_leader("<leader>t", ":tabnew<CR>")
nmap_leader("<leader>c", ":tabclose<CR>")
nmap_leader("<leader>s", ":new<CR>")
nmap_leader("<leader>v", ":vnew<CR>")

-- TABS / TERMINAL
nmap_leader("tc", ":tabclose<CR>")
nmap_leader("tt", [[:terminal<CR>]])
nmap_leader("ts", [[:split term://%:p:h//mksh<CR>]])
nmap_leader("tv", [[:vsplit term://%:p:h//mksh<CR>]])
nmap_leader("tp", ':tabnew<CR>:setlocal buftype=nofile bufhidden=hide noswapfile buflisted<CR>"*p')

-- ENCRYPTION (visual)
xmap_leader("mr", [[:'<,'>!gpg -ear<CR>]])
xmap_leader("me", [[:'<,'>!gpg -ac<CR>]])
xmap_leader("md", [[:'<,'>!gpg -q -d<CR>]])

-- REGEXES
vim.api.nvim_create_user_command("Equote",  [[execute '%s/^.\+$/"&"/g']], {})
vim.api.nvim_create_user_command("Esquote", [[execute '%s/^.\+$/''&''/g']], {})
vim.api.nvim_create_user_command("Ereverse",[[execute 'g/^/m0']], {})
vim.api.nvim_create_user_command("Euntab",  [[execute :%s/\t/\r/g<CR>]], {})
vim.api.nvim_create_user_command("Etotab",  [[execute :%s/\n/\t/g<CR>]], {})
vim.api.nvim_create_user_command("Idin",    [[execute '%s/^.\+$/''&''/g' | ]], {})
vim.api.nvim_create_user_command("IdIn",    [[execute '%s/\(.*\)/"\1"/g']], {})
vim.api.nvim_create_user_command("Ejoin", function()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local non_empty = vim.tbl_filter(function(l) return l ~= "" end, lines)
  local result = table.concat(non_empty, ",")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, { result })
  vim.fn.setreg("+", result)
end, {})

nmap_leader([[e"]], [[:Equote<CR>]])
nmap_leader([[e']], [[:Esquote<CR>]])
nmap_leader("e,",   [[:%s/\(.*\)/\1,/g<CR>]])
nmap_leader("es",   [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>]])
nmap_leader("dash", [[:%s/val_.*,/val_,/g <Bar> let i=1 <Bar> g/val_/s//\='val_'.i/ <Bar> let i=i+1<CR>]])
nmap_leader("eu",   [[:Euntab<CR>]])
nmap_leader("et",   [[:Etotab<CR>]])
nmap_leader("ex",   [[:%s/.*`\(.*\)`.*/\1/g<CR>]])

-- SEARCH
nmap("<Esc>", "<cmd>nohlsearch<CR>")
nmap("n", "nzzzv", "Search forward")
nmap("N", "Nzzzv", "Search backward")

-- TERMINAL
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- WINDOW NAVIGATION
nmap("<C-H>", "<C-w>h", "Focus left window")
nmap("<C-J>", "<C-w>j", "Focus below window")
nmap("<C-K>", "<C-w>k", "Focus above window")
nmap("<C-L>", "<C-w>l", "Focus right window")

-- WINDOW RESIZE (respects v:count)
vim.keymap.set("n", "<C-Left>", '"<Cmd>vertical resize -" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = "Decrease window width" })
vim.keymap.set("n", "<C-Up>",   '"<Cmd>resize -"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = "Decrease window height" })
vim.keymap.set("n", "<C-Down>", '"<Cmd>resize +"          . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = "Increase window height" })
vim.keymap.set("n", "<C-Right>",'"<Cmd>vertical resize +" . v:count1 . "<CR>"', { expr = true, replace_keycodes = false, desc = "Increase window width" })
