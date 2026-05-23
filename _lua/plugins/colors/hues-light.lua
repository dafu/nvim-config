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

-- vim.o.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]

-- vim.o.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkon0-Cursor/lCursor,sm:block-blinkon0]]
vim.o.background = "light"

require("mini.hues").setup({
	-- TODO: have a look at the whole repo: https://github.com/pkazmier/nvim/blob/main/lua/plugins/mini/hues.lua
	background = "#eff1f5",
	foreground = "#1e1e2e",

	accent = "bg",
	saturation = "medium",
	n_hues = 8,
	plugins = {
		default = true,
		["echasnovski/mini.nvim"] = true,
		["ibhagwan/fzf-lua"] = true,
		["NeogitOrg/neogit"] = true,
	},
})

-- transparent background
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor"
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
