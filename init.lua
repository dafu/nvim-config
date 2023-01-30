local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

-- plugins
require("packer").startup(function(use)
	-- Plugin manager
	use("wbthomason/packer.nvim")

	-- statuscool
	use{
		'luukvbaal/statuscol.nvim',
		config = function() require('statuscol').setup(
			{
				separator = ' ',
				order = 'SNsFs',
				setopt = true,
			}
			)
		end
	}

	-- Essentials
	use("lewis6991/impatient.nvim")
	use("jamessan/vim-gnupg")
	-- use 'junegunn/fzf'
	-- use 'junegunn/fzf.vim'
	use("romainl/vim-cool")
	use("tpope/vim-obsession")
	use("tpope/vim-vinegar")
	use("tpope/vim-commentary")
	use("tpope/vim-surround")
	use("tpope/vim-fugitive")
	use("farmergreg/vim-lastplace")
	use("echasnovski/mini.nvim")

	use("sbdchd/neoformat")

	-- use{
	-- 	'ibhagwan/smartyank.nvim',
	-- 	setup = function()
	-- 		require('smartyank').setup({
	-- 			highlight = {
	-- 				enabled = true, -- highlight yanked text
	-- 				higroup = 'IncSearch', -- highlight group of yanked text
	-- 				timeout = 500, -- timeout for clearing the highlight
	-- 			},
	-- 			clipboard = {
	-- 				enabled = true,
	-- 			},
	-- 			tmux = {
	-- 				enabled = true,
	-- 				-- remove `-w` to disable copy to host client's clipboard
	-- 				cmd = { 'tmux', 'set-buffer', '-w' },
	-- 			},
	-- 			osc52 = {
	-- 				enabled = true,
	-- 				-- escseq = 'tmux',     -- use tmux escape sequence, only enable if
	-- 				-- you're using tmux and have issues (see #4)
	-- 				ssh_only = true, -- false to OSC52 yank also in local sessions
	-- 				silent = true, -- true to disable the 'n chars copied' echo
	-- 				echo_hl = 'Directory', -- highlight group of the OSC52 echo message
	-- 			},
	-- 		})
	-- 	end,
	-- }

	-- use 'ojroques/vim-oscyank'
	use("equalsraf/neovim-gui-shim")

	-- Trouble
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	}

	-- LSP
	use{
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			-- Snippet Collection (Optional)
			{ "rafamadriz/friendly-snippets" },
			-- Useful status updates for LSP
			{ "j-hui/fidget.nvim" },

			-- Additional lua configuration, makes nvim stuff amazing
			{ "folke/neodev.nvim" },
		},
	}

	-- Treesitter
	use { 
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update({ with_sync = true }))
		end,
	}

	-- Additional text objects via treesitter
	use { 		
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
	}

	-- Gitsigns
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end,
	}

	use("kyazdani42/nvim-web-devicons")
	-- use {
	--   "nvim-lualine/lualine.nvim",
	--   after = "github-nvim-theme",
	--   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	--   config = function()
	--     require("lualine").setup {
	--       options = {
	--         theme = "auto" -- or you can assign github_* themes individually.
	--         -- ... your lualine config
	--       }
	--     }
	--   end
	-- }
	--
	-- Colorscheme
	use{
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				theme_style = "dimmed",
				comment_style = "italic",
				keyword_style = "italic",
				function_style = "italic",
				variable_style = "italic",
			})
		end,
	}

	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides even on blank lines
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("tpope/vim-sleuth") -- Detect tabstop and shiftwidth automatically

	-- Fuzzy Finder (files, lsp, etc)
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	use("natecraddock/telescope-zf-native.nvim")
	-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, "custom.plugins")
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require("packer").sync()
	end
end)
-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print("==================================")
	print("    Plugins are being installed")
	print("    Wait until Packer completes,")
	print("       then restart nvim")
	print("==================================")
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	command = "source <afile> | silent! LspStop | silent! LspStart | PackerCompile",
	group = packer_group,
	pattern = vim.fn.expand("$MYVIMRC"),
})


-- Enable Comment.nvim
require("Comment").setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("indent_blankline").setup({
	char = "┊",
	show_trailing_blankline_indent = false,
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

pcall(require("telescope").load_extension, "zf-native")

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require("nvim-treesitter.install").compilers = { "gcc" }
require("nvim-treesitter.configs").setup({
	-- Add languages to be installed here that you want installed for treesitter
	ensure_installed = { "lua", "go", "html", "css", "c", "javascript", "markdown", "php", "rust", "typescript", "vim" },

	highlight = { enable = true },
	indent = { enable = true, disable = { "python" } },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<c-space>",
			node_incremental = "<c-space>",
			scope_incremental = "<c-s>",
			node_decremental = "<c-backspace>",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
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
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})

vim.o.grepprg = [[rg --vimgrep --hidden -g "!.git"]]
vim.api.nvim_set_keymap('n', '<leader>/', ':silent grep ', { silent = false })

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("recommended")

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  -- signs = true,
  -- update_in_insert = false,
  -- underline = true,
  -- severity_sort = true,
  -- float = {
  --   focusable = false,
  --   style = 'minimal',
  --   border = 'rounded',
  --   source = 'always',
  --   header = '',
  --   prefix = '',
  -- },
})

require("neodev").setup()
require("fidget").setup()

-- mini
require("mini.align").setup()
require("mini.statusline").setup()
require("mini.basics").setup()
-- require('mini.completion').setup()
-- require('mini.cursorword').setup()
-- own stuff
require("dafu")

vim.opt.shortmess:append('I') -- skip Intro
vim.o.backspace='indent,eol,start' -- allow backspace
vim.o.whichwrap=[[b,s,<,>,[,]] -- allow keys to cross eol
