local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

later(function()
	add({ source = "folke/zen-mode.nvim" })
	vim.keymap.set("n", "<leader>Z", "<cmd>ZenMode<cr>", { desc = "ZenMode" })
	require("zen-mode").setup({
		window = {
			backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
			-- height and width can be:
			-- * an absolute number of cells when > 1
			-- * a percentage of the width / height of the editor when <= 1
			-- * a function that returns the width or the height
			width = 1, -- width of the Zen window
			height = 1, -- height of the Zen window
			-- by default, no options are changed for the Zen window
			-- uncomment any of the options below, or add other vim.wo options you want to apply
			options = {
				signcolumn = "no", -- disable signcolumn
				number = false, -- disable number column
				relativenumber = false, -- disable relative numbers
				cursorline = false, -- disable cursorline
				cursorcolumn = false, -- disable cursor column
				foldcolumn = "0", -- disable fold column
				list = false, -- disable whitespace characters
			},
		},
		plugins = {
			-- disable some global vim options (vim.o...)
			-- comment the lines to not apply the options
			options = {
				enabled = true,
				ruler = false, -- disables the ruler text in the cmd line area
				showcmd = false, -- disables the command in the last line of the screen
				-- you may turn on/off statusline in zen mode by setting 'laststatus'
				-- statusline will be shown only if 'laststatus' == 3
				laststatus = 0, -- turn off the statusline in zen mode
			},
			-- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
			gitsigns = { enabled = true }, -- disables git signs
			tmux = { enabled = true }, -- disables the tmux statusline
		},
		-- callback where you can add custom code when the Zen window opens
		on_open = function(win) end,
		-- callback where you can add custom code when the Zen window closes
		on_close = function() end,
	})
end)
