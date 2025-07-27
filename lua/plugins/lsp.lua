local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	-- add("folke/trouble.nvim")
	-- require("trouble").setup()

	add({ source = "mason-org/mason.nvim" })
	require("mason").setup()

	add("ray-x/go.nvim")
	require("go").setup({
		diagnostic = false, -- disabled to avoid overriding diagnostic config
		lsp_inlay_hints = { enable = false }, -- disabled because the plugin enables this globally
	})
end)
