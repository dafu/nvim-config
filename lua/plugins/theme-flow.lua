local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	add("0xstepit/flow.nvim")
	require("flow").setup({
		theme = {
			style = "dark", --  "dark" | "light"
			contrast = "default", -- "default" | "high"
			transparent = true, -- true | false
		},
		colors = {
			mode = "default", -- "default" | "dark" | "light"
			fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
		},
		ui = {
			borders = "light", -- "theme" | "inverse" | "fluo" | "none"
			aggressive_spell = false, -- true | false
		},
	})
	vim.cmd("colorscheme flow")
end)
