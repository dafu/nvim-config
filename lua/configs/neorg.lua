require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.norg.completion"] = { config = { engine = "nvim-compe" } },
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.keybinds"] = { config = { default_keybinds = true, neorg_leader = "<Leader>o" } },
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { config = { workspaces = { my_workspace = "~/neorg" }}  },
  }
}

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main"
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main"
  },
}
