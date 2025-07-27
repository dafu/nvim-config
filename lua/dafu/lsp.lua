-- Defined in init.lua
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.lsp.enable({ "lua_ls", "gopls" })

local symbols = {
	[vim.diagnostic.severity.ERROR] = "󰅚 ",
	[vim.diagnostic.severity.WARN] = "󰀪 ",
	[vim.diagnostic.severity.INFO] = "󰋽 ",
	[vim.diagnostic.severity.HINT] = "󰌶 ",
}

-- Diagnostics
vim.diagnostic.config({
	update_in_insert = false, -- false so diags are updated on InsertLeave
	-- signs = { text = symbols },
	virtual_text = false,
	loclist = {
		open = true,
		severity = { min = vim.diagnostic.severity.WARN },
	},
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = { text = symbols },
	virtual_text = {
		source = "if_many",
		spacing = 4,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

vim.keymap.set("n", "gK", function()
	vim.lsp.inlay_hint.enable(not vim.diagnostic.is_enabled())
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	-- local new_config = not vim.diagnostic.config().virtual_lines
	-- vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostics" })
vim.keymap.set("n", "gk", vim.diagnostic.open_float)
-- vim.keymap.set("n", "<leader>K", vim.diagnostic.setloclist)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "gL", function()
	local enabled = not vim.lsp.inlay_hint.is_enabled({})
	vim.lsp.inlay_hint.enable(enabled)
	vim.notify("Inlay hints: " .. (enabled and " on" or "off"))
end, { buffer = 0, desc = "Toggle inlay hints" })
