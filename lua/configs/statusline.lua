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

-- old o.statusline=[[%#Visual#%{(mode()=='n')?' N ':''}%#DiffChange#%{(mode()=='i')?' I ':''}%#DiffDelete#%{(mode()=='r')?' R ':''}%#Cursor#%{(mode()=='v')?' V ':''}%#Visual# %f %m%h%r%=%y %{&ff} %{strlen(&fenc)?&fenc:''} %N %4l %3p%% ]]
--  old set ruler rulerformat=%70(%=%f\ %m%h%r%y\ %{&ff}\ %{strlen(&fenc)?&fenc:''}\ %N\ %4l\ %3p%%\ %)
-- local fn = vim.fn
-- local api = vim.api

-- local function filetype()
--   return string.format(" %s ", vim.bo.filetype):upper()
-- end

-- local function filename()
--   local fname = fn.expand "%:t"
--   if fname == "" then
--       return ""
--   end
--   return fname .. ""
-- end

-- local function filepath()
--   local fpath = fn.fnamemodify(fn.expand "%", ":~:.:h")
--   if fpath == "" or fpath == "." then
--       return ""
--   end

--   return string.format(" %%<%s/", fpath)
-- end

-- local modes = {
--   ["n"] = "N",
--   ["no"] = "N",
--   ["v"] = "V",
--   ["V"] = "V",
--   [""] = "V",
--   ["i"] = "I",
--   ["ic"] = "I",
--   ["R"] = "R",
--   ["Rv"] = "V",
--   ["c"] = "C",
--   ["cv"] = "X",
--   ["ce"] = "X",
--   ["r"] = "P",
--   ["rm"] = "M",
--   ["r?"] = "C",
--   ["!"] = "S",
--   ["t"] = "T",
-- }

-- local function git()
--   local branch = fn.FugitiveHead()

--   if branch and #branch > 0 then
--     branch = '  '..branch
--   end

--   return branch
-- end

-- local function mode()
--   local current_mode = api.nvim_get_mode().mode
--   return string.format(" %s ", modes[current_mode]):upper()
-- end

-- local function lsp()
--   local count = {}
--   local levels = {
--     errors = "Error",
--     warnings = "Warn",
--     info = "Info",
--     hints = "Hint",
--   }

--   for k, level in pairs(levels) do
--     count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
--   end

--   local errors = ""
--   local warnings = ""
--   local hints = ""
--   local info = ""

--   if count["errors"] ~= 0 then
--     errors = " %#LspDiagnosticsSignError# " .. count["errors"]
--   end
--   if count["warnings"] ~= 0 then
--     warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
--   end
--   if count["hints"] ~= 0 then
--     hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
--   end
--   if count["info"] ~= 0 then
--     info = " %#LspDiagnosticsSignInformation# " .. count["info"]
--   end

--   return errors .. warnings .. hints .. info .. "%#Normal#"
-- end

-- local function lineinfo()
--   if vim.bo.filetype == "alpha" then
--     return ""
--   end
--   return "%P %l:%c"
-- end

-- Statusline = {}

-- Statusline.active = function()
--   return table.concat {
--     "%#Statusline#",
--     mode(),
--     "%#Normal# ",
--     filepath(),
--     filename(),
--     git(),
--     "%#Normal#",
--     "%=%#StatusLineExtra#",
--     lsp(),
--     filetype(),
--     lineinfo(),
--   }
-- end

-- function Statusline.inactive()
--   return " %F"
-- end

-- function Statusline.short()
--   return "%#StatusLineNC#   NvimTree"
-- end

-- -- api.nvim_exec([[
-- --     augroup Statusline
-- --     au!
-- --   au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
-- --   au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
-- --   augroup END
-- -- ]], false)

