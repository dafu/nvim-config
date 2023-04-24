return {
	-- Colorscheme
	{
		'projekt0n/github-nvim-theme',
		lazy = false,
		priority = 1000,
		config = function()
			-- require('github-theme').setup({
			-- 	comment_style = 'italic',
			-- 	keyword_style = 'italic',
			-- 	function_style = 'italic',
			-- 	variable_style = 'italic',
			-- })
			vim.cmd([[colorscheme github_dimmed]])
		end,
	},
}

