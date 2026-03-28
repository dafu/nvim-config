local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()

	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()

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
					{ hl = "LineNr", strings = { diagnostics } }, -- diagnostics } },
					-- { hl = "LineNr", strings = { fileinfo } },
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
					{ hl = "LineNr", strings = { diff, search , fileinfo } },
				})
			end,
		},
	})
	-- require("mini.starter").setup()
	require("mini.ai").setup()
	require("mini.align").setup()
	require("mini.comment").setup()

	require("mini.pick").setup(
  {
    -- Delays (in ms; should be at least 1)
    delay = {
      -- Delay between forcing asynchronous behavior
      async = 10,

      -- Delay between computation start and visual feedback about it
      busy = 50,
    },

    -- Keys for performing actions. See `:h MiniPick-actions`.
    mappings = {
      caret_left  = '<Left>',
      caret_right = '<Right>',

      choose            = '<CR>',
      choose_in_split   = '<C-s>',
      choose_in_tabpage = '<C-t>',
      choose_in_vsplit  = '<C-v>',
      choose_marked     = '<M-CR>',

      delete_char       = '<BS>',
      delete_char_right = '<Del>',
      delete_left       = '<C-u>',
      delete_word       = '<C-w>',

      mark     = '<C-x>',
      mark_all = '<C-a>',

      move_down  = '<C-n>',
      move_start = '<C-g>',
      move_up    = '<C-p>',

      paste = '<C-r>',

      refine        = '<C-Space>',
      refine_marked = '<M-Space>',

      scroll_down  = '<C-f>',
      scroll_left  = '<C-h>',
      scroll_right = '<C-l>',
      scroll_up    = '<C-b>',

      stop = '<Esc>',

      toggle_info    = '<S-Tab>',
      toggle_preview = '<Tab>',
    },

    -- General options
    options = {
      -- Whether to show content from bottom to top
      content_from_bottom = false,

      -- Whether to cache matches (more speed and memory on repeated prompts)
      use_cache = false,
    },

    -- Source definition. See `:h MiniPick-source`.
    source = {
      items = nil,
      name  = nil,
      cwd   = nil,

      match   = nil,
      show    = nil,
      preview = nil,

      choose        = nil,
      choose_marked = nil,
    },

    -- Window related options
    window = {
      -- Float window config (table or callable returning it)
        -- relative = 'cursor', anchor = 'NW',
        -- row = 0, col = 0, width = 40, height = 20,
      config = {
        anchor = 'NW',
        row = 0, col = 0, width = 70, height = 30,
        },

      -- String to use as caret in prompt
      prompt_caret = '>',

      -- String to use as prefix in prompt
      prompt_prefix = '',
    },
  }

  )

	vim.keymap.set("n", "<leader>p", "<nop>")
	vim.keymap.set("n", "<leader>pp", "<nop>")
	vim.keymap.set("n", "<leader>fd", "<Cmd>Pick oldfiles<CR>", { desc = "Pick Oldfiles" })
	vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>", { desc = "Pick files" })
	vim.keymap.set("n", "<leader>f:", '<Cmd>Pick history scope=":"<CR>', { desc = "Pick history" })
	vim.keymap.set("n", "<leader>fb", "<Cmd>Pick buffers<CR>", { desc = "Pick buffers" })
	vim.keymap.set("n", "<leader>fg", "<Cmd>Pick grep_live<CR>", { desc = "Pick grep_live" })
	vim.keymap.set("n", "<leader>fl", "<Cmd>Pick buf_lines<CR>", { desc = "Pick buflines" })
	vim.keymap.set("n", "<leader>fs", '<Cmd>Pick visit_paths cwd=""<CR>', { desc = "Pick visit_paths" })

	require("mini.surround").setup()
	require("mini.bufremove").setup()
	-- require("mini.indentscope").setup()
	require("mini.visits").setup()

	-- priortiy fixes overriding diag symbol
	require("mini.diff").setup({ view = { priority = 1 } })

	require("mini.extra").setup()
	require("mini.git").setup()
	require("mini.sessions").setup()

	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'DOING', 'DONE', 'NOTE'

			-- nonascii = {
			-- 	pattern = function(buf_id)
			-- 		if vim.bo[buf_id].filetype ~= "oil" then
			-- 			return "[^%z\1-\127]"
			-- 		end
			-- 		return nil
			-- 	end,
			-- 	group = "MiniHipatternsHack",
			-- },
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

-- 	require("mini.basics").setup({
-- 		options = {
-- 			basic = true,
-- 			extra_ui = true,
-- 			win_borders = "bold",
-- 		},
-- 		mappings = {
-- 			windows = true,
-- 		},
-- 		autocommands = {
-- 			basic = true,
-- 			-- relnum_in_visual_mode = true,
-- 		},
-- 	})

	require("mini.files").setup({
		content = {
			filter = nil,
			prefix = nil,
			sort = nil,
		},

		mappings = {
			close = "<ESC>",
			go_in = "l",
			go_in_plus = "<CR>",
			go_out = "h",
			go_out_plus = "-",
			reset = "_",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		options = {
			permanent_delete = true,
			use_as_default_explorer = true,
		},

		windows = {
			max_number = 2, -- math.huge,
			preview = true,
			width_focus = 30,
			width_nofocus = 30,
			width_preview = 30,
		},
	})

	vim.keymap.set("n", "-", function()
		local buf_name = vim.api.nvim_buf_get_name(0)
		local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
		MiniFiles.open(path)
		MiniFiles.reveal_cwd()
	end, { desc = "Open Mini Files" })

	-- highlight cursorword
	require("mini.cursorword").setup()
	vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", {}) -- no hl for current word
	-- vim.api.nvim_set_hl(0, "MiniCursorword", { link = "IncSearch" }) -- link to search
end)
