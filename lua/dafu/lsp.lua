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

local signs = {
	ERROR = "",
	WARN = "",
	HINT = "󰌵",
	INFO = "",
}

-- Diagnostics
vim.diagnostic.config({
	signs = { priority = 9999 },
	underline = true,
	update_in_insert = false, -- false so diags are updated on InsertLeave
	virtual_text = {
		prefix = function(diagnostic)
			return signs[vim.diagnostic.severity[diagnostic.severity]]
		end,
		spacing = 2,
		virt_text_pos = "right_align",
		current_line = true,
		severity = { min = "WARN", max = "ERROR" },
	},
	loclist = {
		open = true,
		severity = { min = vim.diagnostic.severity.WARN },
	},
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
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
