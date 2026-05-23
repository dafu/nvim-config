local now, now_if_args, later = Config.now, Config.now_if_args, Config.later
Config.now(function()
	require("mini.icons").setup()
	MiniIcons.mock_nvim_web_devicons()

	require("mini.notify").setup()
	vim.notify = require("mini.notify").make_notify()

	require("mini.pick").setup({
		-- Delays (in ms; should be at least 1)
		delay = {
			-- Delay between forcing asynchronous behavior
			async = 10,

			-- Delay between computation start and visual feedback about it
			busy = 50,
		},

		-- Keys for performing actions. See `:h MiniPick-actions`.
		mappings = {
			caret_left = "<Left>",
			caret_right = "<Right>",

			choose = "<CR>",
			choose_in_split = "<C-s>",
			choose_in_tabpage = "<C-t>",
			choose_in_vsplit = "<C-v>",
			choose_marked = "<M-CR>",

			delete_char = "<BS>",
			delete_char_right = "<Del>",
			delete_left = "<C-u>",
			delete_word = "<C-w>",

			mark = "<C-x>",
			mark_all = "<C-a>",

			move_down = "<C-n>",
			move_start = "<C-g>",
			move_up = "<C-p>",

			paste = "<C-r>",

			refine = "<C-Space>",
			refine_marked = "<M-Space>",

			scroll_down = "<C-f>",
			scroll_left = "<C-h>",
			scroll_right = "<C-l>",
			scroll_up = "<C-b>",

			stop = "<Esc>",

			toggle_info = "<S-Tab>",
			toggle_preview = "<Tab>",
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
			name = nil,
			cwd = nil,

			match = nil,
			show = nil,
			preview = nil,

			choose = nil,
			choose_marked = nil,
		},

		-- Window related options
		window = {
			-- Float window config (table or callable returning it)
			-- relative = 'cursor', anchor = 'NW',
			-- row = 0, col = 0, width = 40, height = 20,
			config = {
				anchor = "NW",
				row = 0,
				col = 0,
				width = 70,
				height = 30,
			},

			-- String to use as caret in prompt
			prompt_caret = ">",

			-- String to use as prefix in prompt
			prompt_prefix = "",
		},
	})

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

	now_if_args(function()
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
		-- Add common bookmarks for every explorer. Example usage inside explorer:
		-- - `'c` to navigate into your config directory
		-- - `g?` to see available bookmarks
		local add_marks = function()
			MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
			MiniFiles.set_bookmark("~", "~", { desc = "Home" })
			MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
		end
		Config.new_autocmd("User", "MiniFilesExplorerOpen", add_marks, "Add bookmarks")
	end)

	-- highlight cursorword
	-- require("mini.cursorword").setup()
	-- vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", {}) -- no hl for current word
	-- vim.api.nvim_set_hl(0, "MiniCursorword", { link = "IncSearch" }) -- link to search
end)
