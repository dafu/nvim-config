local lua_file = {
  'options',
  'statusline',
  'autocmds',
  'plugins',
  'keybinds',
  'fzf',
  'treesitter',
  'lsp',
  'wiki',
  'timer',
  'gopls',
  'neoformat',
  'gpg',
  'nord',
}


function Reloadconfig()
  package.path = package.path .. ';' .. vim.fn.stdpath('config') .. '/?.lua'
  -- vim.fn.execute('source ' .. vim.fn.stdpath('config').. '/' .. f .. '.lua')
  for _, f in pairs(lua_file) do
    for name,_ in pairs(package.loaded) do
      if name:match(f) then
        package.loaded[name] = nil
      end
    end
    local ok, _ = pcall(require, f)
    if not ok then
      print('Error loading: ' .. f)
    else
      print('loading: ' .. f)
    end
  end
end

Reloadconfig()

vim.cmd('command! Reloadconfig lua Reloadconfig()')

-- package.path = package.path .. ";../timer.lua"

--  if &listchars ==# 'eol:$'
--    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
--  endif
-- g.fillchars+=vert:\║
-- NETRW
-- opt.netrw_dirhistmax = 0
-- opt.netrw_banner = 0
-- opt.netrw_liststyle = 3
-- opt.netrw_winsize = '30'

-- cmd("hi LineNr guibg=NONE")
-- cmd("hi SignColumn guibg=NONE")
-- cmd("hi VertSplit guibg=NONE")
-- cmd("highlight DiffAdd guifg=#81A1C1 guibg = none")
-- cmd("highlight DiffChange guifg =#3A3E44 guibg = none")
-- cmd("highlight DiffModified guifg = #81A1C1 guibg = none")
-- cmd("hi EndOfBuffer guifg=#282c34")

-- cmd("hi Normal guibg=none ctermbg=none")
-- cmd("hi LineNr guibg=none ctermbg=none")
-- cmd("hi Folded guibg=none ctermbg=none")
-- cmd("hi NonText guibg=none ctermbg=none")
-- cmd("hi SpecialKey guibg=none ctermbg=none")
-- cmd("hi VertSplit guibg=none ctermbg=none")
-- cmd("hi SignColumn guibg=none ctermbg=none")
-- cmd("hi EndOfBuffer guibg=none ctermbg=none")
