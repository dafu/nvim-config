-- local M = {}

-- function M.config()
  local nord_status_ok, nord = pcall(require, "nord")
  if not nord_status_ok then
    return
  end

  vim.g.nord_contrast = false
  vim.g.nord_borders = true
  vim.g.nord_disable_background = true
  vim.g.nord_italic = true

  require('nord').set()

  vim.cmd("colorscheme nord")

-- end


-- return M
