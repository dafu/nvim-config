return {
  'shaunsingh/nord.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- Example config in lua
    -- vim.g.nord_contrast = true
    vim.g.nord_borders = false
    vim.g.nord_disable_background = true
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true
    require 'nord'.set()
    -- load the colorscheme here
    vim.cmd([[colorscheme nord]])
  end,
  opts = {}
}
