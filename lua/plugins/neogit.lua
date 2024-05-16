local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
	add({
		source = "NeogitOrg/neogit",
		depends = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			-- Only one of these is needed, not both.
			"ibhagwan/fzf-lua", -- optional
		},
	})
	require("neogit").setup({})
end)
