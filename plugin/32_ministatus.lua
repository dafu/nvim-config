vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
require("mini.statusline").setup({
	-- Whether to set Vim's settings for statusline (make it always shown with
	-- 'laststatus' set to 2). To use global statusline in Neovim>=0.7.0, set
	-- this to `false` and 'laststatus' to 3.
	set_vim_settings = true,
	content = {
		inactive = function()
			local filename = MiniStatusline.section_filename({ trunc_width = 2000 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				{ hl = "LineNr", strings = { filename } },
				"%<", -- Mark general truncate point
				"%=", -- End left alignment
			})
		end,
		active = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 2000 })
			local filename = MiniStatusline.section_filename({ trunc_width = 2000 })
			local git = MiniStatusline.section_git({ trunc_width = 75 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 2000 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

			return MiniStatusline.combine_groups({
				{ hl = "WarningMsg", strings = { mode } },
				-- { hl = mode_hl, strings = { mode } },
				"%<", -- Mark general truncate point
				{ hl = "LineNr", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "WarningMsg", strings = { git } },
				{ hl = "DiagnosticsOk", strings = { diagnostics, lsp } },
				{ hl = "LineNr", strings = { diff, search, fileinfo } },
			})
		end,
	},
})
