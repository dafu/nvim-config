MiniDeps.now(function()
	MiniDeps.add("ibhagwan/fzf-lua")
	require("fzf-lua").setup({
		oldfiles = {
			include_current_session = true, -- show files from current session
		},
		previewers = {
			builtin = {
				-- disable preview for large files
				syntax_limit_b = 1024 * 100, -- 100KB
			},
		},
		grep = {
			rg_glob = true, -- enable glob parsing
			glob_flag = "--iglob", -- case insensitive globs
			glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
		},
	})
	-- require("fzf-lua").setup({})
	-- vim.keymap.set("n", "<c-P>", function() require('fzf-lua').files({ ... }) end, { desc = "Fzf Files" })
	vim.keymap.set("n", "<leader>po", function()
		require("fzf-lua").oldfiles({ resume = true })
	end, { desc = "Fzf Oldfiles" })
	vim.keymap.set("n", "<leader>pf", function()
		require("fzf-lua").files({ resume = true })
	end, { desc = "Fzf Files" })
	vim.keymap.set("n", "<leader>pg", function()
		require("fzf-lua").live_grep({ resume = true })
	end, { desc = "Fzf Grep Files" })
end)
