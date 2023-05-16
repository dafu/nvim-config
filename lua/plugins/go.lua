return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
    --  "ray-x/guihua.lua",
     -- "neovim/nvim-lspconfig",
      --"nvim-treesitter/nvim-treesitter",
    },
    -- event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    config = function()
      require("go").setup()
      local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.go",
          callback = function()
            require('go.format').goimport()
          end,
          group = format_sync_grp,
          })

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
          }
          vim.diagnostic.open_float(nil, opts)
        end
        })
    end,
  },
}
