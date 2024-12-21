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
			relnum_in_visual_mode = true,
		},
	})

	-- require("mini.hues").setup({
	-- 	background = "#2e3440",
	-- 	foreground = "#eceff4",
	--
	-- 	accent = "bg",
	-- 	-- saturation = "low",
	-- 	n_hues = 4,
	-- 	plugins = {
	-- 		default = true,
	-- 		-- ["echasnovski/mini.nvim"] = true,
	-- 		-- ["folke/trouble.nvim"] = true,
	-- 		-- ["hrsh7th/nvim-cmp"] = true,
	-- 		-- ["lewis6991/gitsigns.nvim"] = true,
	-- 		-- ["williamboman/mason.nvim"] = true,
	-- 	},
	-- }) -- nord

	require("mini.icons").setup()

	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()

	require("mini.tabline").setup()
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
		-- set_vim_settings = false,
		content = {
			active = function()
				local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
				local git = MiniStatusline.section_git({ trunc_width = 75 })
				-- local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
				local filename = MiniStatusline.section_filename({ trunc_width = 140 })
				local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
				-- local location = MiniStatusline.section_location({ trunc_width = 75 })
				local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

				return MiniStatusline.combine_groups({
					{ hl = mode_hl, strings = { mode } },
					{ hl = "MiniStatuslineFilename", strings = { git } }, --, diagnostics } },
					"%<", -- Mark general truncate point
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					"%=", -- End left alignment
					{ hl = "MiniStatuslineFilename", strings = { fileinfo } },
					{ hl = "MiniStatuslineFilename", strings = { search } }, -- location
				})
			end,
		},
	})
	-- require("mini.starter").setup()
	require("mini.ai").setup()
	require("mini.comment").setup()
	require("mini.pick").setup()
	require("mini.surround").setup()
	require("mini.bufremove").setup()
	-- require("mini.indentscope").setup()
	require("mini.visits").setup()
	require("mini.diff").setup()
	require("mini.extra").setup()

	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'DOING', 'DONE', 'NOTE'
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			doing = { pattern = "%f[%w]()DOING()%f[%W]", group = "MiniHipatternsHack" },
			done = { pattern = "%f[%w]()DONE()%f[%W]", group = "MiniHipatternsNote" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})
end)
