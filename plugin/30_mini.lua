-- stylua: ignore start
local now, now_if_args, later = Config.now, Config.now_if_args, Config.later

-- NOW =========================================================================

-- Icons: needed early by tabline, statusline, and many UI components.
now(function()
  require("mini.icons").setup()
  MiniIcons.mock_nvim_web_devicons()
end)

-- Notifications: must work from the very first startup message.
now(function()
  require("mini.notify").setup()
  vim.notify = require("mini.notify").make_notify()
end)

now(function() require("mini.tabline").setup() end)

now(function()
  vim.api.nvim_set_hl(0, "Normal",      { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLine",  { bg = "none" })
  vim.api.nvim_set_hl(0, "StatusLineNC",{ bg = "none" })
  require("mini.statusline").setup({
    set_vim_settings = true,
    content = {
      inactive = function()
        local filename = MiniStatusline.section_filename({ trunc_width = 2000 })
        return MiniStatusline.combine_groups({
          { hl = "LineNr", strings = { filename } },
          "%<",
          "%=",
        })
      end,
      active = function()
        local mode     = MiniStatusline.section_mode({ trunc_width = 2000 })
        local filename = MiniStatusline.section_filename({ trunc_width = 2000 })
        local git      = MiniStatusline.section_git({ trunc_width = 75 })
        local diff     = MiniStatusline.section_diff({ trunc_width = 75 })
        local diag     = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp      = MiniStatusline.section_lsp({ trunc_width = 75 })
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 2000 })
        local search   = MiniStatusline.section_searchcount({ trunc_width = 75 })
        return MiniStatusline.combine_groups({
          { hl = "WarningMsg", strings = { mode } },
          "%<",
          { hl = "LineNr",    strings = { filename } },
          "%=",
          { hl = "WarningMsg",  strings = { git } },
          { hl = "DiagnosticOk",strings = { diag, lsp } },
          { hl = "LineNr",      strings = { diff, search, fileinfo } },
        })
      end,
    },
  })
end)

-- Starter screen: must be available before the first buffer is shown.
-- now(function()
--   local starter = require("mini.starter")
--   starter.setup({
--     evaluate_single = true,
--     header = [[
-- ██████╗  █████╗ ███████╗██╗   ██╗   ██████╗ ███████╗██╗   ██╗
-- ██╔══██╗██╔══██╗██╔════╝██║   ██║   ██╔══██╗██╔════╝██║   ██║
-- ██║  ██║███████║█████╗  ██║   ██║   ██║  ██║█████╗  ██║   ██║
-- ██║  ██║██╔══██║██╔══╝  ██║   ██║   ██║  ██║██╔══╝  ╚██╗ ██╔╝
-- ██████╔╝██║  ██║██║     ╚██████╔╝██╗██████╔╝███████╗ ╚████╔╝
-- ╚═════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝╚═════╝ ╚══════╝  ╚═══╝  ]],
--     footer = "",
--     items = {
--       starter.sections.recent_files(10, false),
--       starter.sections.recent_files(5, true),
--       starter.sections.sessions(5, true),
--     },
--     content_hooks = {
--       starter.gen_hook.adding_bullet(),
--       starter.gen_hook.aligning("center", "center"),
--     },
--   })
-- end)

-- NOW IF ARGS =================================================================

-- Completion: only relevant when a file is being edited.
-- See `:h MiniCompletion.completefunc_lsp` and `:h MiniCompletion.get_lsp_capabilities()`.
now_if_args(function()
  local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
  end
  require("mini.completion").setup({
    lsp_completion = {
      source_func = "omnifunc",
      auto_setup = false,
      process_items = process_items,
    },
  })
  local on_attach = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
  end
  Config.new_autocmd("LspAttach", nil, on_attach, "Set 'omnifunc'")
  vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

-- Misc: auto-root, cursor restore, terminal background sync.
-- See `:h MiniMisc.setup_auto_root()`, `:h MiniMisc.setup_restore_cursor()`.
now_if_args(function()
  require("mini.misc").setup()
  MiniMisc.setup_auto_root()
  MiniMisc.setup_restore_cursor()
  MiniMisc.setup_termbg_sync()
end)

-- Files: file explorer. `-` opens at current file or cwd.
now_if_args(function()
  require("mini.files").setup({
    content = { filter = nil, prefix = nil, sort = nil },
    mappings = {
      close       = "<ESC>",
      go_in       = "l",
      go_in_plus  = "<CR>",
      go_out      = "h",
      go_out_plus = "-",
      reset       = "_",
      reveal_cwd  = "@",
      show_help   = "g?",
      synchronize = "=",
      trim_left   = "<",
      trim_right  = ">",
    },
    options = {
      permanent_delete = true,
      use_as_default_explorer = true,
    },
    windows = {
      max_number   = 2,
      preview      = true,
      width_focus   = 30,
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

  local add_marks = function()
    MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
    MiniFiles.set_bookmark("~", "~",                      { desc = "Home" })
    MiniFiles.set_bookmark("w", vim.fn.getcwd,            { desc = "Working directory" })
  end
  Config.new_autocmd("User", "MiniFilesExplorerOpen", add_marks, "Add bookmarks")
end)

-- LATER =======================================================================

-- Extra: must be loaded before 'mini.ai' (provides gen_ai_spec).
later(function() require("mini.extra").setup() end)

-- Extend and create a/i textobjects.
-- - `ci)` change inside parenthesis, `yaq` yank around quote, `vif` select inside function call.
-- See `:h MiniAi-builtin-textobjects`.
-- later(function()
--   local ai = require("mini.ai")
--   ai.setup({
--     custom_textobjects = {
--       B = MiniExtra.gen_ai_spec.buffer(),
--       F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
--     },
--     search_method = "cover",
--   })
-- end)

-- Align text interactively.
-- - `gaip,` align inside paragraph by comma; `gAip` interactive alignment.
-- See `:h MiniAlign-example`.
-- later(function() require("mini.align").setup() end)

-- later(function() require('mini.animate').setup() end)

-- Go forward/backward with square brackets: `]b` next buffer, `[Q` first quickfix, etc.
-- See `:h MiniBracketed`.
-- later(function() require("mini.bracketed").setup() end)

-- later(function() require("mini.bufremove").setup() end)

-- -- Key clues window. Press `<Leader>` and wait to see available next keys.
-- -- See `:h MiniClue-examples`.
-- later(function()
--   local miniclue = require("mini.clue")
--   -- stylua: ignore
--   miniclue.setup({
--     clues = {
--       Config.leader_group_clues,
--       miniclue.gen_clues.builtin_completion(),
--       miniclue.gen_clues.g(),
--       miniclue.gen_clues.marks(),
--       miniclue.gen_clues.registers(),
--       miniclue.gen_clues.square_brackets(),
--       miniclue.gen_clues.windows({ submode_resize = true }),
--       miniclue.gen_clues.z(),
--     },
--     triggers = {
--       { mode = { 'n', 'x' }, keys = '<Leader>' },
--       { mode =   'n',        keys = '\\' },
--       { mode = { 'n', 'x' }, keys = '[' },
--       { mode = { 'n', 'x' }, keys = ']' },
--       { mode =   'i',        keys = '<C-x>' },
--       { mode = { 'n', 'x' }, keys = 'g' },
--       { mode = { 'n', 'x' }, keys = "'" },
--       { mode = { 'n', 'x' }, keys = '`' },
--       { mode = { 'n', 'x' }, keys = '"' },
--       { mode = { 'i', 'c' }, keys = '<C-r>' },
--       { mode =   'n',        keys = '<C-w>' },
--       { mode = { 'n', 'x' }, keys = 's' },
--       { mode = { 'n', 'x' }, keys = 'z' },
--     },
--   })
-- end)
--
-- later(function() require("mini.cmdline").setup() end)

-- Diff: priority 1 to avoid overriding diagnostic signs.
later(function() require("mini.diff").setup({ view = { priority = 1 } }) end)

later(function() require("mini.git").setup() end)

later(function()
  local hipatterns = require("mini.hipatterns")
  hipatterns.setup({
    highlighters = {
      fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
      hack  = { pattern = "%f[%w]()HACK()%f[%W]",  group = "MiniHipatternsHack"  },
      todo  = { pattern = "%f[%w]()TODO()%f[%W]",  group = "MiniHipatternsTodo"  },
      doing = { pattern = "%f[%w]()DOING()%f[%W]", group = "MiniHipatternsHack"  },
      done  = { pattern = "%f[%w]()DONE()%f[%W]",  group = "MiniHipatternsNote"  },
      note  = { pattern = "%f[%w]()NOTE()%f[%W]",  group = "MiniHipatternsNote"  },
      hex_color = hipatterns.gen_highlighter.hex_color({ style = "inline", inline_text = " ⬤ " }),
    },
  })
end)

-- later(function() require("mini.jump").setup() end)

-- later(function() require("mini.jump2d").setup() vim.keymap.set("n", "<Leader>j", ":lua MiniJump2d.start()<cr>") end)

-- Text edit operators: replace (`gr`), duplicate (`gm`), sort (`gs`), exchange (`gx`), eval (`g=`).
-- Also maps `(` / `)` to swap adjacent arguments.
-- See `:h MiniOperators-overview`.
-- later(function()
--   require("mini.operators").setup()
--   vim.keymap.set("n", "(", "gxiagxila", { remap = true, desc = "Swap arg left" })
--   vim.keymap.set("n", ")", "gxiagxina", { remap = true, desc = "Swap arg right" })
-- end)

-- later(function() require("mini.pairs").setup({ modes = { command = true } }) end)

-- Fuzzy picker. `<Leader>f*` mappings defined here complement those in 20_keymaps.lua.
-- See `:h MiniPick-overview`.
later(function()
  require("mini.pick").setup({
    delay = { async = 10, busy = 50 },
    mappings = {
      caret_left    = "<Left>",
      caret_right   = "<Right>",
      choose        = "<CR>",
      choose_in_split   = "<C-s>",
      choose_in_tabpage = "<C-t>",
      choose_in_vsplit  = "<C-v>",
      choose_marked = "<M-CR>",
      delete_char       = "<BS>",
      delete_char_right = "<Del>",
      delete_left   = "<C-u>",
      delete_word   = "<C-w>",
      mark          = "<C-x>",
      mark_all      = "<C-a>",
      move_down     = "<C-n>",
      move_start    = "<C-g>",
      move_up       = "<C-p>",
      paste         = "<C-r>",
      refine        = "<C-Space>",
      refine_marked = "<M-Space>",
      scroll_down   = "<C-f>",
      scroll_left   = "<C-h>",
      scroll_right  = "<C-l>",
      scroll_up     = "<C-b>",
      stop          = "<Esc>",
      toggle_info    = "<S-Tab>",
      toggle_preview = "<Tab>",
    },
    options = { content_from_bottom = false, use_cache = false },
    window = {
      config = { anchor = "NW", row = 0, col = 0, width = 70, height = 30 },
      prompt_caret  = ">",
      prompt_prefix = "",
    },
  })

  vim.keymap.set("n", "<leader>p",  "<nop>")
  vim.keymap.set("n", "<leader>pp", "<nop>")
  vim.keymap.set("n", "<leader>fd", "<Cmd>Pick oldfiles<CR>",                { desc = "Pick oldfiles" })
  vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>",                   { desc = "Pick files" })
  vim.keymap.set("n", "<leader>f:", '<Cmd>Pick history scope=":"<CR>',        { desc = "Pick history" })
  vim.keymap.set("n", "<leader>fb", "<Cmd>Pick buffers<CR>",                 { desc = "Pick buffers" })
  vim.keymap.set("n", "<leader>fg", "<Cmd>Pick grep_live<CR>",               { desc = "Pick grep live" })
  vim.keymap.set("n", "<leader>fl", "<Cmd>Pick buf_lines<CR>",               { desc = "Pick buf lines" })
  vim.keymap.set("n", "<leader>fs", '<Cmd>Pick visit_paths cwd=""<CR>',      { desc = "Pick visit paths" })
end)

-- later(function() require("mini.sessions").setup() end)

-- Snippets: loads from config/snippets/ and installed plugins (e.g. friendly-snippets).
-- Navigate tabstops with `<C-l>` / `<C-h>`. See `:h MiniSnippets`.
-- later(function()
--   local latex_patterns = { "latex/**/*.json", "**/latex.json" }
--   local lang_patterns = {
--     tex              = latex_patterns,
--     plaintex         = latex_patterns,
--     markdown_inline  = { "markdown.json" },
--   }
--   local snippets  = require("mini.snippets")
--   local config_path = vim.fn.stdpath("config")
--   snippets.setup({
--     snippets = {
--       snippets.gen_loader.from_file(config_path .. "/snippets/global.json"),
--       snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
--     },
--   })
--   -- MiniSnippets.start_lsp_server()
-- end)

-- Split/join arguments with `gS`. See `:h MiniSplitjoin`.
-- later(function() require("mini.splitjoin").setup() end)

-- later(function() require("mini.surround").setup() end)

-- `<Leader>ot` trims trailing whitespace.
-- later(function() require("mini.trailspace").setup() end)

-- later(function() require("mini.visits").setup() end)
