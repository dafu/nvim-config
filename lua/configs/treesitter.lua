-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

require 'nvim-treesitter.install'.compilers = { "gcc" }
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "go", "html", "css", "c", "javascript", "markdown", "php", "rust" },
  -- -- ignore_install = { "javascript" },
  -- -- ensure_installed = "maintained",
  -- highlight = { 
  --   enable = true,
  --   additional_vim_regex_highlighting = false,
  -- }
-- }

-- require("nvim-treesitter.configs").setup({
  -- ensure_installed = "all",
  -- ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
    disable = { "latex" },
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  autotag = { enable = true },
  autopairs = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
}
