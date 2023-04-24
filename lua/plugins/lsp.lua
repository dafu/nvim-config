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
      require("neodev").setup()
      require("fidget").setup()
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
			{ 'L3MON4D3/LuaSnip' },
			-- Snippet Collection (Optional,
			{ 'rafamadriz/friendly-snippets' },
			-- Useful status updates for LSP
			{ 'j-hui/fidget.nvim' },
			-- Additional lua configuration, makes nvim stuff amazing
			{ 'folke/neodev.nvim' },
		},
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
    -- Additional text objects via treesitter
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
  },
}
