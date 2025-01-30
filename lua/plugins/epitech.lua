return {
	"quentin-lpr/epitech.nvim",
	event = "VeryLazy",
	config = function()
		require("epitech").setup()

		local wk = require("which-key")
		wk.add({
			{ "<leader>H", "<CMD>EpiHeader<CR>", mode = "n", desc = "Add EPITECH header", icon = { icon = "󰛼", color = "white" } },
		})
	end,
}
