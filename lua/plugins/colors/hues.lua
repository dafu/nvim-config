local function mod_hl(hl_name, opts)
	local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
	if is_ok then
		for k, v in pairs(opts) do
			hl_def[k] = v
		end
		vim.api.nvim_set_hl(0, hl_name, hl_def)
	end
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
	group = vim.api.nvim_create_augroup("Color", {}),
	pattern = "*",
	callback = function()
		mod_hl("Comment", { italic = true })
		mod_hl("@comment", { italic = true })
		mod_hl("@string", { italic = true })
		mod_hl("MiniTablineVisible", { italic = true })
		mod_hl("MiniTablineCurrent", { italic = true })
	end,
})

require("mini.tabline").setup()
require("mini.hues").setup({
	-- TODO: have a look at the whole repo: https://github.com/pkazmier/nvim/blob/main/lua/plugins/mini/hues.lua
	background = "#1e1e2e",
	foreground = "#cdd6f4",

	accent = "bg",
	saturation = "lowmedium",
	n_hues = 8,
	plugins = {
		default = true,
		["echasnovski/mini.nvim"] = true,
		["ibhagwan/fzf-lua"] = true,
		["NeogitOrg/neogit"] = true,
		-- ["folke/trouble.nvim"] = true,
		-- ["hrsh7th/nvim-cmp"] = true,
		-- ["lewis6991/gitsigns.nvim"] = true,
		-- ["williamboman/mason.nvim"] = true,
	},
})

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
