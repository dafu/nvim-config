local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	add("folke/trouble.nvim")
	require("trouble").setup()
end)

--
--   add 'lewis6991/gitsigns.nvim'
--   require('gitsigns').setup {
--     signs = {
--       add = { text = '│' },
--       change = { text = '│' },
--       delete = { text = '_' },
--       topdelete = { text = '‾' },
--       changedelete = { text = '~' },
--       untracked = { text = '│' },
--       -- untracked    = { text = '┆' },
--     },
--     signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
--     numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
--     linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
--     word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
--     watch_gitdir = {
--       interval = 1000,
--       follow_files = true,
--     },
--     attach_to_untracked = false,
--     current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
--     current_line_blame_opts = {
--       virt_text = true,
--       virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
--       delay = 1000,
--       ignore_whitespace = false,
--     },
--     current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
--     sign_priority = 6,
--     update_debounce = 100,
--     status_formatter = nil, -- Use default
--     max_file_length = 40000, -- Disable if file is longer than this (in lines)
--     preview_config = {
--       -- Options passed to nvim_open_win
--       border = 'single',
--       style = 'minimal',
--       relative = 'cursor',
--       row = 0,
--       col = 1,
--     },
--     yadm = {
--       enable = false,
--     },
--   }
-- end)

-- later(function()
--   add { source = 'folke/todo-comments.nvim', depends = { 'nvim-lua/plenary.nvim' } }
--   require('todo-comments').setup {}
-- end)

later(function()
	-- Supply dependencies near target plugin
	add({ source = "neovim/nvim-lspconfig", depends = { "williamboman/mason.nvim" } })
end)

now(function()
	add({
		--    -- LSP Configuration & Plugins
		source = "neovim/nvim-lspconfig",
		depends = {
			--       -- Automatically install LSPs and related tools to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	})

	--     config = function()
	--       --  This function gets run when an LSP attaches to a particular buffer.
	--       --    That is to say, every time a new file is opened that is associated with
	--       --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
	--       --    function will be executed to configure the current buffer
	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "<leader>k", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>K", vim.diagnostic.setloclist)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end

			-- Displays hover information about the symbol under the cursor
			map("K", "<cmd>lua vim.lsp.buf.hover()<cr>", "")
			-- Jump to the definition
			map("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "")
			-- Jump to declaration
			map("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "")
			-- Lists all the implementations for the symbol under the cursor
			map("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "")
			-- Jumps to the definition of the type symbol
			map("go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "")
			-- Lists all the references
			map("gr", "<cmd>lua vim.lsp.buf.references()<cr>", "")
			-- Displays a function's signature information
			map("gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "")
			-- Renames all references to the symbol under the cursor
			map("<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", "")
			-- Selects a code action available at the current cursor position
			map("<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", "")
			-- Show diagnostics in a floating window
			map("gl", "<cmd>lua vim.diagnostic.open_float()<cr>", "")
			-- Move to the previous diagnostic
			map("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", "")

			-- Jump to the definition of the word under your cursor.
			--  This is where a variable was first declared, or where a function is defined, etc.
			--  To jump back, press <C-T>.
			-- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

			-- Find references for the word under your cursor.
			-- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

			-- Jump to the implementation of the word under your cursor.
			--  Useful when your language has ways of declaring types without an actual implementation.
			-- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

			-- Jump to the type of the word under your cursor.
			--  Useful when you're not sure what type a variable is and you want to see
			--  the definition of its *type*, not where it was *defined*.
			-- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

			-- Fuzzy find all the symbols in your current document.
			--  Symbols are things like variables, functions, types, etc.
			-- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

			-- Fuzzy find all the symbols in your current workspace
			--  Similar to document symbols, except searches over your whole project.
			-- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

			-- Rename the variable under your cursor
			--  Most Language Servers support renaming across files, etc.
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

			-- Opens a popup that displays documentation about the word under your cursor
			--  See `:help K` for why this keymap
			map("K", vim.lsp.buf.hover, "Hover Documentation")

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

			map("<leader>K", vim.lsp.buf.hover, "Hover")
			map("gi", vim.lsp.buf.implementation, "Implementation")
			map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
			map("<leader>rn", vim.lsp.buf.rename, "Rename")

			-- The following two autocommands are used to highlight references of the
			-- word under your cursor when your cursor rests there for a little while.
			--    See `:help CursorHold` for information about when this is executed
			--
			-- When you move your cursor, the highlights will be cleared (the second autocommand).
			-- local client = vim.lsp.get_client_by_id(event.data.client_id)
			-- if client and client.server_capabilities.documentHighlightProvider then
			-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			-- 		buffer = event.buf,
			-- 		callback = vim.lsp.buf.document_highlight,
			-- 	})
			--
			-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			-- 		buffer = event.buf,
			-- 		callback = vim.lsp.buf.clear_references,
			-- 	})
			-- end
		end,
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	--
	--       -- Enable the following language servers
	--       --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
	--       --
	--       --  Add any additional override configuration in the following tables. Available keys are:
	--       --  - cmd (table): Override the default command used to start the server
	--       --  - filetypes (table): Override the default list of associated filetypes for the server
	--       --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
	--       --  - settings (table): Override the default settings passed when initializing the server.
	--       --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
	local servers = {
		-- clangd = {},
		gopls = {},
		-- sqlls = {},
		-- rust_analyzer = {},
		-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
		--
		-- Some languages (like typescript) have entire language plugins that can be useful:
		--    https://github.com/pmizio/typescript-tools.nvim
		--
		-- But for many setups, the LSP (`tsserver`) will work just fine
		-- tsserver = {},
		--

		lua_ls = {
			-- cmd = {...},
			-- filetypes { ...},
			-- capabilities = {},
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						-- Tells lua_ls where to find all the Lua files that you have loaded
						-- for your neovim configuration.
						library = {
							"${3rd}/luv/library",
							unpack(vim.api.nvim_get_runtime_file("", true)),
						},
						-- If lua_ls is really slow on your computer, you can try this instead:
						-- library = { vim.env.VIMRUNTIME },
					},
					-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
					-- diagnostics = { disable = { 'missing-fields' } },
				},
			},
		},
	}

	-- Ensure the servers and tools above are installed
	--  To check the current status of installed tools and/or manually install
	--  other tools, you can run
	--    :Mason
	--
	--  You can press `g?` for help in this menu
	require("mason").setup()

	-- You can add other tools here that you want Mason to install
	-- for you, so that they are available from within Neovim.
	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua", -- Used to format lua code
	})
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

	require("mason-lspconfig").setup({
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				require("lspconfig")[server_name].setup({
					cmd = server.cmd,
					settings = server.settings,
					filetypes = server.filetypes,
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
				})
			end,
		},
	})
end)

-- formatting
now(function()
	add("stevearc/conform.nvim")
	require("conform").setup({
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 2500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt", "gofumpt" },
			sql = { "sqlfluff" },
			javascript = { "prettierd", "prettier" },
			svelte = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
		},
	})
end)
