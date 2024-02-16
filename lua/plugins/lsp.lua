return {
  -- Trouble
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    config = function()
      local lsp = require("lsp-zero")
      lsp.preset("recommended")
      lsp.setup()

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        -- update_in_insert = false,
        -- underline = true,
        -- severity_sort = true,
        float = {
          focusable = false,
          style = 'minimal',
          border = 'rounded',
          source = 'always',
          header = '',
          prefix = '',
        },
      })
      -- require("neodev").setup()
      -- require("fidget").setup()
    end,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
      }
      -- Snippet Collection (Optional,
      -- { 'rafamadriz/friendly-snippets' },
      -- Useful status updates for LSP
      -- { 'j-hui/fidget.nvim' },
      -- Additional lua configuration, makes nvim stuff amazing
      -- { 'folke/neodev.nvim' },
    },
  },

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    -- Additional text objects via treesitter
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        -- sync_install = false,
        -- auto_install = true,

        -- List of parsers to ignore installing (for "all")
        -- ignore_install = { "javascript" },

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

        highlight = {
          enable = true,
          -- disable = { "c", "rust" },
          -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
  },
}
