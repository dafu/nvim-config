if vim.g.neovide then
	vim.o.guifont = "JetBrainsMono NF:h9" -- text below applies for VimScript

	vim.opt.linespace = 0
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_transparency = 0.97
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_trail_size = 0

	vim.keymap.set(
		{ "n", "v" },
		"<C-+>",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
		{ silent = true, remap = false }
	)
	vim.keymap.set(
		{ "n", "v" },
		"<C-->",
		":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
		{ silent = true, remap = false }
	)
	vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true, remap = false })
end
