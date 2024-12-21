-- https://github.com/echasnovski/mini.nvim

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path }
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
--
-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
-- local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

require("plugins.lsp")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.oil")
require("plugins.fzf")
require("plugins.neogit")
require("plugins.colors")
require("plugins.md")
require("plugins.zen")
