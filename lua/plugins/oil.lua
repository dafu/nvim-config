local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	add("stevearc/oil.nvim")
	require("oil").setup({
		default_file_explorer = false,
	})
end)
