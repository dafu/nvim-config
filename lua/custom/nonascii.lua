-- https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/trailspace.lua
-- Module definition ==========================================================
local NonAscii = {}
local H = {}

--- Module setup
---
---@param config table|nil Module config table. See |NonAscii.config|.
---
---@usage `require('mini.trailspace').setup({})` (replace `{}` with your `config` table)
NonAscii.setup = function(config)
  -- Export module
  _G.NonAscii = NonAscii

  -- Setup config
  config = H.setup_config(config)

  -- Apply config
  H.apply_config(config)

  -- Define behavior
  H.create_autocommands(config)

  -- Create default highlighting
  H.create_default_hl()

  -- Initialize highlight (usually takes effect during startup)
  vim.defer_fn(NonAscii.highlight, 0)
end

--- Module config
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
NonAscii.config = {
  -- Highlight only in normal buffers (ones with empty 'buftype'). This is
  -- useful to not show trailing whitespace where it usually doesn't matter.
  only_in_normal_buffers = true,
}
--minidoc_afterlines_end

-- Module functionality =======================================================
--- Highlight trailing whitespace in current window
NonAscii.highlight = function()
  -- Highlight only in normal mode
  if H.is_disabled() or vim.fn.mode() ~= 'n' then
    NonAscii.unhighlight()
    return
  end

  -- Possibly work only in normal buffers
  if H.get_config().only_in_normal_buffers and not H.is_buffer_normal() then return end

  -- Don't add match id on top of existing one
  if H.get_match_id() ~= nil then return end

  vim.fn.matchadd('NonAscii', "\v[[:alpha:]!$&*_+=|<.>?-]+%(:?[[:alnum:]!#$%&*_+=|'<.>/?-])*[#:]@<!")
  -- öß
end

--- Unhighlight trailing whitespace in current window
NonAscii.unhighlight = function()
  -- Use `pcall` because there is an error if match id is not present. It can
  -- happen if something else called `clearmatches`.
  pcall(vim.fn.matchdelete, H.get_match_id())
end

-- Helper data ================================================================
-- Module default config
H.default_config = NonAscii.config

-- Helper functionality =======================================================
-- Settings -------------------------------------------------------------------
H.setup_config = function(config)
  -- General idea: if some table elements are not present in user-supplied
  -- `config`, take them from default config
  vim.validate({ config = { config, 'table', true } })
  config = vim.tbl_deep_extend('force', H.default_config, config or {})

  vim.validate({ only_in_normal_buffers = { config.only_in_normal_buffers, 'boolean' } })

  return config
end

H.apply_config = function(config) NonAscii.config = config end

H.create_autocommands = function(config)
  local augroup = vim.api.nvim_create_augroup('NonAscii', {})

  local au = function(event, pattern, callback, desc)
    vim.api.nvim_create_autocmd(event, { group = augroup, pattern = pattern, callback = callback, desc = desc })
  end

  -- NOTE: Respecting both `WinEnter` and `BufEnter` seems to be useful to
  -- account of different order of handling buffer opening in new window.
  -- Notable example: 'nvim-tree' at commit a1600e5.
  au({ 'WinEnter', 'BufEnter', 'InsertLeave' }, '*', NonAscii.highlight, 'Highlight')
  au({ 'WinLeave', 'BufLeave', 'InsertEnter' }, '*', NonAscii.unhighlight, 'Unhighlight')

  if config.only_in_normal_buffers then
    -- Add tracking of 'buftype' changing because it can be set after events on
    -- which highlighting is done. If not done, highlighting appears but
    -- disappears if buffer is reentered.
    au('OptionSet', 'buftype', H.track_normal_buffer, 'Track normal buffer')
  end
end

H.create_default_hl = function() vim.api.nvim_set_hl(0, 'NonAscii', { default = true, link = 'Error' }) end

H.is_disabled = function() return vim.g.nonascii_disable == true or vim.b.nonascii_disable == true end

H.get_config = function(config)
  return vim.tbl_deep_extend('force', NonAscii.config, vim.b.nonascii_config or {}, config or {})
end

H.track_normal_buffer = function()
  if not H.get_config().only_in_normal_buffers then return end

  -- This should be used with 'OptionSet' event for 'buftype' option
  -- Empty 'buftype' means "normal buffer"
  if vim.v.option_new == '' then
    NonAscii.highlight()
  else
    NonAscii.unhighlight()
  end
end

H.is_buffer_normal = function(buf_id) return vim.api.nvim_buf_get_option(buf_id or 0, 'buftype') == '' end

H.get_match_id = function()
  -- NOTE: this can be replaced with more efficient custom tracking of id per
  -- window but it will have more edge cases (like won't update on manual
  -- `clearmatches()`)
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group == 'NonAscii' then return match.id end
  end
end

return NonAscii
