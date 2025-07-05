--
MiniDeps.now(function()
	MiniDeps.add({
		source = "nvim-treesitter/nvim-treesitter",
		-- Use 'master' while monitoring updates in 'main'
		checkout = "master",
		monitor = "main",
		-- Perform action after every checkout
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	require("nvim-treesitter.configs").setup({
		modules = {},
		sync_install = true,
		ignore_install = {},
		auto_install = false,
		ensure_installed = {},
		-- ensure_installed = { "lua", "vimdoc", "go", "html", "templ", "json" },
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
	})
end)
