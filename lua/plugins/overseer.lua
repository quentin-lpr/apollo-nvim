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
				{ "<leader>rb", "<CMD>OverseerBuild<CR><Esc>", mode = "n", desc = "Build", icon = { icon = "", color = "white" } },
				{ "<leader>rr", "<CMD>OverseerRun<CR><Esc>", mode = "n", desc = "Run", icon = { icon = "", color = "white" } },
				{ "<leader>rt", "<CMD>OverseerToggle<CR><Esc>", mode = "n", desc = "Toggle panel", icon = { icon = "", color = "white" } },
				{ "<leader>rs", "<CMD>OverseerSaveBundle<CR><Esc>", mode = "n", desc = "Save tasks", icon = { icon = "", color = "white" } },
				{ "<leader>rl", "<CMD>OverseerLoadBundle!<CR><Esc>", mode = "n", desc = "Load tasks", icon = { icon = "󰈞", color = "white" } },
				{ "<leader>rd", "<CMD>OverseerDeleteBundle<CR><Esc>", mode = "n", desc = "Delete tasks", icon = { icon = "󰆴", color = "white" } },
				{ "<leader>rT", "<CMD>OverseerTaskAction<CR><Esc>", mode = "n", desc = "Show tasks", icon = { icon = "", color = "white" } },
				{ "<leader>rq", "<CMD>OverseerQuickAction<CR><Esc>", mode = "n", desc = "Quick action", icon = { icon = "", color = "white" } },
			},
		})
	end,
}
