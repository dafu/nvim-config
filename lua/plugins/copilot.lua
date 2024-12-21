local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
	add("zbirenbaum/copilot.lua")
	require("copilot").setup({})
	-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end)
