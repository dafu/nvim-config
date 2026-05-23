-- stylua: ignore start
-- ├ init.lua          Initial (this) file executed during startup
-- ├ plugin/           Files automatically sourced during startup
-- ├── 10_options.lua  Built-in Neovim behavior
-- ├── 20_keymaps.lua  Custom mappings
-- ├── 30_mini.lua     MINI configuration
-- ├── 40_plugins.lua  Plugins outside of MINI
-- ├ snippets/         User defined snippets (has demo file)
-- ├ after/            Files to override behavior added by plugins
-- ├── ftplugin/       Files for filetype behavior (has demo file)
-- ├── lsp/            Language server configurations (has demo file)
-- ├── snippets/       Higher priority snippet files (has demo file)
--
-- Define config table to be able to pass data between scripts
-- It is a global variable which can be use both as `_G.Config` and `Config`
_G.Config = {}

-- Load now to have 'mini.misc' available for custom loading helpers.
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- - `:h MiniMisc.safely()`
local misc = require('mini.misc')
Config.now = function(f) misc.safely('now', f) end
Config.later = function(f) misc.safely('later', f) end
Config.now_if_args = vim.fn.argc(-1) > 0 and Config.now or Config.later
Config.on_event = function(ev, f) misc.safely('event:' .. ev, f) end
Config.on_filetype = function(ft, f) misc.safely('filetype:' .. ft, f) end

-- Define custom autocommand group and helper to create an autocommand.
local gr = vim.api.nvim_create_augroup('custom-config', {})
Config.new_autocmd = function(event, pattern, callback, desc)
  local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
  vim.api.nvim_create_autocmd(event, opts)
end

-- Define custom `vim.pack.add()` hook helper. See `:h vim.pack-events`.
-- Example usage: see 'plugin/40_plugins.lua'.
Config.on_packchanged = function(plugin_name, kinds, callback, desc)
  local f = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if not (name == plugin_name and vim.tbl_contains(kinds, kind)) then return end
    if not ev.data.active then vim.cmd.packadd(plugin_name) end
    callback()
  end
  Config.new_autocmd('PackChanged', '*', f, desc)
end
-- stylua: ignore end
