-- Neovim plugin for GitHub Copilot
return {
	{
		"github/copilot.vim",
		event = "BufReadPre",
		config = function()
			vim.cmd("Copilot disable")
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "BufReadPre",
		branch = "canary",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			debug = false,
			window = {
				layout = "float",
				width = 0.9,
				height = 0.9,
				border = "rounded",
				title = "Copilot Chat",
			},
			mappings = {
				close = {
					normal = "<Esc>",
				},
			},
			model = "claude-3.5-sonnet",
			question_header = "  User ",
			answer_header = "  Copilot ",
			error_header = "  Error ",
			auto_insert_mode = true,
			insert_at_end = true,
			context = "buffers",
			highlight_selection = false,
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			local wk = require("which-key")
			wk.add({
				{
					group = "Copilot",
					"<leader>g",
					{ "<leader>cc", chat.toggle, mode = { "n", "v" }, desc = "Toggle Copilot Chat", icon = { icon = "󰠠", color = "white" } },
					icon = { icon = "󰠠", color = "white" },
				},
			})
		end,
	},
}
