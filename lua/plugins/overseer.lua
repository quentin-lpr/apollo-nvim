return {
	"stevearc/overseer.nvim",
	event = "VeryLazy",
	config = function()
		require("overseer").setup()
		local wk = require("which-key")
		wk.add({
			{
				group = "Run tasks",
				"<leader>r",
				{ "<leader>rt", "<CMD>OverseerToggle<CR><Esc>", mode = "n", desc = "Toggle panel", icon = { icon = "", color = "white" } },
				{ "<leader>rT", "<CMD>OverseerTaskAction<CR><Esc>", mode = "n", desc = "Show tasks", icon = { icon = "", color = "white" } },
			},
		})
	end,
}
