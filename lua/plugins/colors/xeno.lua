MiniDeps.now(function()
	MiniDeps.add({ source = "kyza0d/xeno.nvim", name = "xeno" })

	local xeno = require("xeno")

	xeno.config({ transparent = true, contrast = 0.9 })

	xeno.new_theme("my-theme", {
		base = "#1E1E1E",
		accent = "#8CBE8C",
	})

	vim.cmd("colorscheme my-theme")
end)
