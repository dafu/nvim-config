local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

require 'nvim-treesitter.install'.compilers = { "gcc" }
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "go", "cpp", "c", "javascript", "markdown", "php", },
  -- List of parsers to ignore installing
  -- ignore_install = { "javascript" },
  -- ensure_installed = "maintained",
  highlight = { enable = true }
}

-- vim.cmd([[set foldmethod=expr]])
-- vim.cmd([[set foldexpr=nvim_treesitter#foldexpr()]])

