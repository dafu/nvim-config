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

vim.o.background = "light"
-- require("plugins.colors.catppuccin")
-- require("plugins.colors.xeno")
-- require("plugins.colors.grey")

vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme default")

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- vim.o.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175]]
-- vim.o.guicursor = [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkon0-Cursor/lCursor,sm:block-blinkon0]]
-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor"
