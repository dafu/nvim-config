local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

-- Tree-sitter ================================================================
now_if_args(function()
	-- Define hook to update tree-sitter parsers after plugin is updated
	local ts_update = function()
		vim.cmd("TSUpdate")
	end
	Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")

	add({
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	})

	-- Define languages which will have parsers installed and auto enabled
	-- After changing this, restart Neovim once to install necessary parsers. Wait
	-- for the installation to finish before opening a file for added language(s).
	local languages = {
		-- These are already pre-installed with Neovim. Used as an example.
		"lua",
		"vimdoc",
		"markdown",
		-- Add here more languages with which you want to use tree-sitter
		-- To see available languages:
		-- - Execute `:=require('nvim-treesitter').get_available()`
		-- - Visit 'SUPPORTED_LANGUAGES.md' file at
		--   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
	}
	local isnt_installed = function(lang)
		return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
	end
	local to_install = vim.tbl_filter(isnt_installed, languages)
	if #to_install > 0 then
		require("nvim-treesitter").install(to_install)
	end

	-- Enable tree-sitter after opening a file for a target language
	local filetypes = {}
	for _, lang in ipairs(languages) do
		for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
			table.insert(filetypes, ft)
		end
	end
	local ts_start = function(ev)
		vim.treesitter.start(ev.buf)
	end
	Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)

-- Language servers ===========================================================
now_if_args(function()
	add({ "https://github.com/neovim/nvim-lspconfig" })

	vim.lsp.enable({ "lua_ls", "gopls", "css-lsp", "html-lsp", "zk" })
end)

-- Formatting =================================================================
later(function()
	add({ "https://github.com/stevearc/conform.nvim" })
	require("conform").setup({
		notify_on_error = true,
		format_on_save = {
			timeout_ms = 2500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofmt", "gofumpt" },
			-- sql = { "sqlfluff" },
			javascript = { "oxfmt" },
			svelte = { "prettierd", "prettier" },
			sql = { "sqruff" },
			-- html = { "oxfmt" },
			-- gohtmltmpl = { "oxfmt" },
			["*"] = { "injected" }, -- enables injected-lang formatting for all filetypes
		},
	})
	require("conform").formatters.sqruff = {
		append_args = { "--config", "$HOME/sqruff.config" },
	}

	-- Format Command
	vim.api.nvim_create_user_command("Format", function(args)
		local range = nil
		if args.count ~= -1 then
			local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
			range = {
				start = { args.line1, 0 },
				["end"] = { args.line2, end_line:len() },
			}
		end
		require("conform").format({ async = true, lsp_format = "fallback", range = range })
	end, { range = true })
end)

-- Snippets ===================================================================
-- later(function() add({ "https://github.com/rafamadriz/friendly-snippets" }) end)

now_if_args(function()
	add({ "https://github.com/mason-org/mason.nvim" })
	require("mason").setup()
end)

-- go
now_if_args(function()
	add({ "https://github.com/ray-x/go.nvim" })
	require("go").setup({
		diagnostic = false, -- disabled to avoid overriding diagnostic config
		lsp_inlay_hints = { enable = false }, -- disabled because the plugin enables this globally
	})
end)

now_if_args(function()
  add ({"https://github.com/sindrets/diffview.nvim"})
  add({"https://github.com/NeogitOrg/neogit"})
  require("neogit").setup()
end)

-- linter
-- now_if_args(function()
-- 	add({ "https://github.com/mfussenegger/nvim-lint" })
-- 	local lint = require("lint")
-- 	lint.linters_by_ft = {
-- 		markdown = { "markdownlint" },
-- 		-- go = { "golangcilint" },
-- 		-- css = { "stylelint" },
-- 		sh = { "shellcheck" },
-- 		html = { "eslint_d" },
-- 		gohtml = { "eslint_d" },
-- 		gohtmltmpl = { "htmlhint" },
-- 		js = { "eslint_d" },
-- 		sql = { "sqruff" },
-- 	}
--
-- 	local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
-- 	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
-- 		group = lint_augroup,
-- 		callback = function()
-- 			if vim.bo.modifiable then
-- 				lint.try_lint()
-- 			end
-- 		end,
-- 	})
-- end)
