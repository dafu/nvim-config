MiniDeps.now(function()
	MiniDeps.add("ray-x/go.nvim")
	require("go").setup()
	-- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	pattern = "*.go",
	-- 	callback = function()
	-- 		require("go.format").goimport()
	-- 	end,
	-- 	group = format_sync_grp,
	-- })
end)

vim.cmd("iabbrev <buffer> ife$ if err != nil {<CR><Space>return<CR>}<Esc><Up>A")
vim.cmd("iabbrev <buffer> iff$ if err != nil {<CR><Space>log.Fatal(err)<CR>}<CR>")
