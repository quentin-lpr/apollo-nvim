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
			debug = true,
			window = {
				layout = "float",
				border = "rounded",
				title = "Copilot Chat",
			},
			model = "gpt-4o",
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

			local function ask_copilot()
				chat.ask("Show me something interesting", {
					callback = function(response)
						print("Response:", response)
					end,
				})
			end

			local wk = require("which-key")
			wk.add({
				{
					group = "Copilot",
					"<leader>g",
					{ "<leader>cc", chat.toggle, mode = { "n", "v" }, desc = "Toggle Copilot Chat", icon = { icon = "󰠠", color = "white" } },
					{ "<leader>ca", ask_copilot, mode = { "n", "v" }, desc = "Ask Copilot", icon = { icon = "󰠠", color = "white" } },
					icon = { icon = "󰠠", color = "white" },
				},
			})
		end,
	},
}
