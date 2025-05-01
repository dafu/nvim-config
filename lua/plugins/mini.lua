local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	require("mini.basics").setup({
		options = {
			basic = true,
			extra_ui = false,
			win_borders = "single",
		},
		mappings = {
			windows = true,
		},
		autocommands = {
			basic = true,
			-- relnum_in_visual_mode = true,
		},
	})
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

	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()

	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()

	--	require("mini.files").setup({
	--		-- Customization of shown content
	--		content = {
	--			-- Predicate for which file system entries to show
	--			filter = nil,
	--			-- What prefix to show to the left of file system entry
	--			prefix = nil,
	--			-- In which order to show file system entries
	--			sort = nil,
	--		},
	--
	--		-- Module mappings created only inside explorer.
	--		-- Use `''` (empty string) to not create one.
	--		mappings = {
	--			close = "q",
	--			go_in = "l",
	--			go_in_plus = "L",
	--			go_out = "h",
	--			go_out_plus = "H",
	--			reset = "<BS>",
	--			reveal_cwd = "@",
	--			show_help = "g?",
	--			synchronize = "=",
	--			trim_left = "<",
	--			trim_right = ">",
	--		},
	--
	--		-- General options
	--		options = {
	--			-- Whether to delete permanently or move into module-specific trash
	--			permanent_delete = true,
	--			-- Whether to use for editing directories
	--			use_as_default_explorer = true,
	--		},
	--
	--		-- Customization of explorer windows
	--		windows = {
	--			-- Maximum number of windows to show side by side
	--			max_number = math.huge,
	--			-- Whether to show preview of file/directory under cursor
	--			preview = true,
	--			-- Width of focused window
	--			width_focus = 50,
	--			-- Width of non-focused window
	--			width_nofocus = 15,
	--			-- Width of preview window
	--			width_preview = 25,
	--		},
	--	})

	-- vim.o.cmdheight = 0
	-- vim.o.laststatus = 3
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
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%<", -- Mark general truncate point
					"%=", -- End left alignment
					{ hl = "MiniStatuslineFilename", strings = { diagnostics } }, -- diagnostics } },
					-- { hl = "MiniStatuslineFilename", strings = { fileinfo } },
				})
			end,
			active = function()
				local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 2000 })
				local filename = MiniStatusline.section_filename({ trunc_width = 2000 })
				local git = MiniStatusline.section_git({ trunc_width = 75 })
				local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
				local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 2000 })
				-- local location = MiniStatusline.section_location({ trunc_width = 2000 })
				local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

				return MiniStatusline.combine_groups({
					{ hl = "MiniStatuslineFilename", strings = { mode } },
					-- { hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%<", -- Mark general truncate point
					"%=", -- End left alignment
					{ hl = "MiniStatuslineFilename", strings = { git } }, -- diagnostics } },
					{ hl = "MiniStatuslineFilename", strings = { diagnostics } }, -- diagnostics } },
					{ hl = "MiniStatuslineFilename", strings = { fileinfo } },
					{ hl = "MiniStatuslineFilename", strings = { search } }, -- location
					-- { hl = "MiniStatuslineFilename", strings = { location } }, -- location
				})
			end,
		},
	})
	-- require("mini.starter").setup()
	require("mini.ai").setup()
	require("mini.align").setup()
	require("mini.comment").setup()
	require("mini.pick").setup()
	require("mini.surround").setup()
	require("mini.bufremove").setup()
	-- require("mini.indentscope").setup()
	require("mini.visits").setup()
	require("mini.diff").setup()
	require("mini.extra").setup()
	require("mini.git").setup()

	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'DOING', 'DONE', 'NOTE'

			nonascii = {
				pattern = function(buf_id)
					if vim.bo[buf_id].filetype ~= "oil" then
						return "[^%z\1-\127]"
					end
					return nil
				end,
				group = "MiniHipatternsHack",
			},
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			doing = { pattern = "%f[%w]()DOING()%f[%W]", group = "MiniHipatternsHack" },
			done = { pattern = "%f[%w]()DONE()%f[%W]", group = "MiniHipatternsNote" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			-- hex_color = hipatterns.gen_highlighter.hex_color(),
			-- Hex colors
			hex_color = hipatterns.gen_highlighter.hex_color({
				style = "inline",
				inline_text = " ⬤ ",
			}),
		},
	})
end)
