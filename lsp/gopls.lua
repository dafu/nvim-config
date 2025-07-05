return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gosum" },
	root_markers = {
		"go.mod",
		"go.sum",
	},
	settings = {
		gopls = {
			-- hints = {
			-- assignVariableTypes = true,
			-- compositeLiteralFields = true,
			-- compositeLiteralTypes = true,
			-- constantValues = true,
			-- functionTypeParameters = true,
			-- parameterNames = true,
			-- rangeVariableTypes = true,
			-- },
			gofumpt = true,
			-- usePlaceholders = true,
			-- completeUnimported = true,
			-- staticcheck = true,
			directoryFilters = { "-.git", "-node_modules" },
			-- semanticTokens = true,
		},
	},
}
