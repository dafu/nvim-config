MiniDeps.now(function()
	MiniDeps.add({
		source = "nvim-treesitter/nvim-treesitter",
		checkout = "main",
		-- Perform action after every checkout
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})

	--	local ts_parsers = { "lua", "vim", "vimdoc", "c", "query", "go", "gotmpl", "json", "html", "css", "yaml" }
	--
	--	local ts = vim.treesitter
	--
	--	local ts_enable = function(buffer, lang)
	--		local ok, hl = pcall(ts.query.get, lang, "highlights")
	--		if ok and hl then
	--			ts.start(buffer, lang)
	--		end
	--	end
	--
	--	vim.api.nvim_create_autocmd("FileType", {
	--		desc = "enable treesitter",
	--		callback = function(event)
	--			local ft = event.match
	--			local available = ts_filetypes[ft]
	--			if available == nil then
	--				return
	--			end
	--
	--			local lang = ts.language.get_lang(ft)
	--			local buffer = event.buf
	--
	--			if available then
	--				ts_enable(buffer, lang)
	--				return
	--			end
	--
	--			require("nvim-treesitter").install(lang):await(function()
	--				ts_filetypes[ft] = true
	--				ts_enable(buffer, lang)
	--			end)
	--		end,
	--	})
end)
