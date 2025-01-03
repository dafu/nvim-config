MiniDeps.now(function()
	MiniDeps.add("stevearc/oil.nvim")
	require("oil").setup({
		default_file_explorer = true,
	})
	vim.keymap.set("n", "-", "<CMD>Oil<CR>")
end)
