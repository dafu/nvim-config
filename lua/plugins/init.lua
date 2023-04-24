return {
  -- Essentials
  'lewis6991/impatient.nvim',
  'jamessan/vim-gnupg',
  'romainl/vim-cool',
  'tpope/vim-obsession',
  'tpope/vim-vinegar',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'farmergreg/vim-lastplace',
  'echasnovski/mini.nvim',
  'sbdchd/neoformat',
  'ojroques/vim-oscyank',
  'equalsraf/neovim-gui-shim',
  'rcarriga/nvim-dap-ui', 
  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

}
