MiniDeps.now(function()
	MiniDeps.add("ibhagwan/fzf-lua")
	-- require("fzf-lua").setup({})
	-- vim.keymap.set("n", "<c-P>", function() require('fzf-lua').files({ ... }) end, { desc = "Fzf Files" })
	vim.keymap.set("n", "<leader>pf", function()
		require("fzf-lua").files({ resume = true })
	end, { desc = "Fzf Files" })
	vim.keymap.set("n", "<leader>pg", function()
		require("fzf-lua").live_grep({ resume = true })
	end, { desc = "Fzf Grep Files" })
end)
