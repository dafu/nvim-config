MiniDeps.now(function()
	MiniDeps.add({
		source = "OXY2DEV/markview.nvim",
		depends = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	})
	local presets = require("markview.presets")

	require("markview").setup({
		preview = {
			icon_provider = "mini", -- "internal", -- "mini" or "devicons"
		},
		markdown = {
			headings = presets.headings.glow,
		},
	})

	require("markview.extras.checkboxes").setup()
end)
