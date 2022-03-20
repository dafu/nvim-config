-- https://github.com/rose-pine/neovim
-- Set theme variant
-- Matches terminal theme if unset
-- @usage 'main' | 'moon' | 'dawn'
vim.g.rose_pine_variant = ''

vim.g.rose_pine_bold_vertical_split_line = false
vim.g.rose_pine_inactive_background = false
vim.g.rose_pine_disable_background = false
vim.g.rose_pine_disable_float_background = false
vim.g.rose_pine_disable_italics = false

local p = require('rose-pine.palette')
vim.g.rose_pine_colors = {
	punctuation = p.subtle,
	comment = p.subtle,
	hint = p.iris,
	info = p.foam,
	warn = p.gold,
	error = p.love,

	-- Or set all headings to one colour: `headings = p.text`
	headings = {
		h1 = p.iris,
		h2 = p.foam,
		h3 = p.rose,
		h4 = p.gold,
		h5 = p.pine,
		h6 = p.foam,
	},
}

-- Set colorscheme after options
vim.cmd('colorscheme rose-pine')

-- Toggle variants
vim.api.nvim_set_keymap('n', '<c-m>', [[<cmd>lua require('rose-pine').toggle()<cr>]], { noremap = true, silent = true })

-- Set variant
vim.api.nvim_set_keymap('n', '<c-0>', [[<cmd>lua require('rose-pine').set('main')<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-9>', [[<cmd>lua require('rose-pine').set('moon')<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-8>', [[<cmd>lua require('rose-pine').set('dawn')<cr>]], { noremap = true, silent = true })
