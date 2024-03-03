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
  -- https://lsp-zero.netlify.app/v3.x/guide/lazy-loading-with-lazy-nvim.html
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        })
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
    end
  },
-- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   config = function()
    --     local lsp = require("lsp-zero")
    --     lsp.preset("recommended")
    --     lsp.setup()
    --     require("fidget").setup()

    --     vim.diagnostic.config({
      --       virtual_text = true,
      --       signs = true,
      --       -- update_in_insert = false,
      --       -- underline = true,
      --       -- severity_sort = true,
      --       float = {
        --         focusable = false,
        --         style = 'minimal',
        --         border = 'rounded',
        --         source = 'always',
        --         header = '',
        --         prefix = '',
        --       },
        --     })
        --     -- require("neodev").setup()
        --   end,
        --   dependencies = {
          --     -- LSP Support
          --     { 'neovim/nvim-lspconfig' },
          --     { 'williamboman/mason.nvim' },
          --     { 'williamboman/mason-lspconfig.nvim' },
          --     -- Autocompletion
          --     { 'hrsh7th/nvim-cmp' },
          --     { 'hrsh7th/cmp-buffer' },
          --     { 'hrsh7th/cmp-path' },
          --     { 'saadparwaiz1/cmp_luasnip' },
          --     { 'hrsh7th/cmp-nvim-lsp' },
          --     { 'hrsh7th/cmp-nvim-lua' },
          --     -- Snippets
          --     {
            --       "L3MON4D3/LuaSnip",
            --       -- follow latest release.
            --       version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            --       -- install jsregexp (optional!).
            --       build = "make install_jsregexp"
            --     },
            --     -- Snippet Collection (Optional,
            --     -- { 'rafamadriz/friendly-snippets' },
            --     -- Useful status updates for LSP
            --     { 'j-hui/fidget.nvim' },
            --     -- Additional lua configuration, makes nvim stuff amazing
            --     -- { 'folke/neodev.nvim' },
            --   },
          -- },

          -- Treesitter
          {
            'nvim-treesitter/nvim-treesitter',
            -- Additional text objects via treesitter
            dependencies = {
              'nvim-treesitter/nvim-treesitter-textobjects',
            },
            config = function()
              vim.filetype.add({
                extension = {
                  templ = "templ",
                },
              })
              require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "html" },
                -- Install parsers synchronously (only applied to `ensure_installed`)
                -- sync_install = false,
                auto_install = true,

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
