MiniDeps.now(function()
	MiniDeps.add("stevearc/oil.nvim")
	require("oil").setup({
		default_file_explorer = true,
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
		float = {
			padding = 2,
			max_width = 90,
			max_height = 0,
		},
		win_options = {
			wrap = true,
			winblend = 0,
		},
		keymaps = {
			["<C-c>"] = "actions.close",
			["q"] = "actions.close",
		},
	})
	vim.keymap.set("n", "-", "<CMD>Oil<CR>")
end)
