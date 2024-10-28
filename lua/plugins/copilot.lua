-- Neovim plugin for GitHub Copilot
return {
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			vim.cmd("Copilot disable")
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
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
				border = "double",
				title = "Copilot Chat",
			},
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
					{ "<leader>gc", chat.toggle, mode = { "n", "v" }, desc = "Toggle Copilot Chat", icon = { icon = "󰠠", color = "white" } },
					{ "<leader>ga", ask_copilot, mode = { "n", "v" }, desc = "Ask Copilot", icon = { icon = "󰠠", color = "white" } },
					icon = { icon = "󰠠", color = "white" },
				},
			})
		end,
	},
}
