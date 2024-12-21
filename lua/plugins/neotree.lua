local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	add({ source = "nvim-neo-tree/neo-tree.nvim", depends = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" } })
	require("neo-tree").setup()
	vim.keymap.set("n", "<leader>o", ":Neotree toggle<cr>")
end)
