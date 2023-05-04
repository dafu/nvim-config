return {
  -- Colorscheme
  {
    'catppuccin/nvim',
    config = function()
      require('catppuccin').setup({
        flavour = "frappe", -- latte, frappe, macchiato, mocha
        background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end
}
}


-- 'projekt0n/github-nvim-theme',
-- lazy = false,
-- priority = 1000,
-- config = function()
-- 	-- require('github-theme').setup({
-- 	-- 	comment_style = 'italic',
-- 	-- 	keyword_style = 'italic',
-- 	-- 	function_style = 'italic',
-- 	-- 	variable_style = 'italic',
-- 	-- })
-- 	vim.cmd([[colorscheme github_dimmed]])
-- end,
-- },

