return {
	'echasnovski/mini.nvim',
  config = function()
    require("mini.align").setup()
    require("mini.statusline").setup()
    require("mini.basics").setup()
    -- require('mini.completion').setup()
    -- require('mini.cursorword').setup()
  end

}

