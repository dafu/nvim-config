return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                folds = false,
                init_open_folds = "always",
                icon_preset = "varied",
            }
        },                  -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                default_workspace = "notes",
                workspaces = {
                  notes = "~/notes",
                },
            },
        },
        -- ["core.completion"] = {
        --     config = {
        --         engine = "nvim-cmp",
        --     },
        -- },
    },
  }
end,
  }
