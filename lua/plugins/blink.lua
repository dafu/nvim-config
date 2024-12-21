-- use a release tag to download pre-built binaries
MiniDeps.now(function()
	MiniDeps.add({
		source = "saghen/blink.cmp",
		depends = {
			"rafamadriz/friendly-snippets",
			"giuxtaposition/blink-cmp-copilot",
		},
		checkout = "v0.8.0", -- check releases for latest tag
	})
	require("blink.cmp").setup({
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
	})
end)
