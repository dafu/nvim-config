return {
  'echasnovski/mini.nvim',
  config = function()
    require("mini.trailspace").setup()
    require("mini.sessions").setup()
    require("mini.files").setup()
    require("mini.align").setup()
    require("mini.statusline").setup(
    {
      content = {
        active = 
        function()
          local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 800 })
          local git           = MiniStatusline.section_git({ trunc_width = 75 })
          local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
          local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
          local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
          local location      = MiniStatusline.section_location({ trunc_width = 75 })

          return MiniStatusline.combine_groups({
            { hl = mode_hl,                  strings = { mode } },
            { hl = 'MiniStatuslineDevinfo',  strings = { git, diagnostics } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFileinfo', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            -- { hl = mode_hl,                  strings = { location } },
          })
        end,
        inactive = function()
          local filename      = MiniStatusline.section_filename({ trunc_width = 140 })

          return MiniStatusline.combine_groups({
            { hl = 'MiniStatuslineFileinfo', strings = { filename } },
          })
        end,
      },
      use_icons = true,
      set_vim_settings = false,
    })
    require("mini.basics").setup()
    -- require('mini.completion').setup()
    -- require('mini.cursorword').setup()
  end
}
