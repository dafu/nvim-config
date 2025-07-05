MiniDeps.now(function()
	-- MiniDeps.add({ source = "echasnovski/mini.snippets", checkout = "stable" })
	--
	-- local gen_loader = require("mini.snippets").gen_loader
	-- require("mini.snippets").setup({
	-- 	snippets = {
	-- 		-- Load custom file with global snippets first
	-- 		gen_loader.from_file("~/.config/nvim/snippets/global.json"),
	--
	-- 		-- Load snippets based on current language by reading files from
	-- 		-- "snippets/" subdirectories from 'runtimepath' directories.
	-- 		gen_loader.from_lang(),
	-- 	},
	-- })
	--
	-- MiniDeps.add("rafamadriz/friendly-snippets")
	MiniDeps.add({ source = "echasnovski/mini.completion", checkout = "stable" })
	require("mini.completion").setup()
end)
