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

require("mini.deps").setup({ path = { package = path_package } })

require("plugins.mini")

-- require("plugins.colors.hues")
require("plugins.colors.catppuccin")
-- require("plugins.colors.grey")

require("plugins.lsp")
require("plugins.conform")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.oil")
require("plugins.fzf")
require("plugins.md")
require("plugins.zen")
require("plugins.misc")
require("plugins.lint")
