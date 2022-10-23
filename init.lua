local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

local configs = {
  "core.plugins",
  "core.disabled",
  "core.options",
  "core.statusline",
  "core.autocmds",
  "core.keybinds",
  -- configs
  "configs.lsp",
  -- "configs.lspsaga", not working
  "configs.cmp",
  "configs.fzf",
  "configs.treesitter",
  -- "configs.wiki",
  "configs.timer",
  "configs.gopls",
  "configs.neoformat",
  "configs.gpg",
  "configs.mini",
  "configs.gitsigns",
  "configs.nord",
}

PKGS = {
-- plugins = {
  'savq/paq-nvim',
  -- misc
  'junegunn/fzf',
  'junegunn/fzf.vim',
  'romainl/vim-cool',
  'tpope/vim-obsession',
  'tpope/vim-vinegar',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'farmergreg/vim-lastplace',
  'lewis6991/gitsigns.nvim',
  'echasnovski/mini.nvim',
  'neovim/nvim-lspconfig',
  'neovim/nvim-lsp',
  'onsails/lspkind-nvim',
  'jose-elias-alvarez/null-ls.nvim',
  -- 'glepnir/lspsaga.nvim',
  'ibhagwan/smartyank.nvim',
  -- 'ojroques/vim-oscyank',
  'equalsraf/neovim-gui-shim',
  -- lang
  'fatih/vim-go',
  'nvim-treesitter/nvim-treesitter',

  -- utils
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'lewis6991/impatient.nvim',
  -- colors
  -- 'akinsho/bufferline.nvim',
  'shaunsingh/nord.nvim',
  -- 'EdenEast/nightfox.nvim',
  'jamessan/vim-gnupg',
}

for _, f in pairs(configs) do
  local ok, err = pcall(require, f)
  if not ok then
    print('Error loading: ' .. f .. ' ' .. err)
  end
end

paq = require 'paq'
paq (PKGS)
