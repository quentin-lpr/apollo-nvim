return {
	"deadbaed/vim-epitech",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>H", "<CMD>TekAddHeader<CR>", mode = "n", desc = "Add EPITECH header", icon = { icon = "󰛼", color = "white" } },
		})
	end,
}
