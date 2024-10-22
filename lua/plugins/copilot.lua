return {
	{
		"github/copilot.vim",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
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

			vim.keymap.set({ "n", "v" }, "<leader>gc", chat.toggle, { noremap = true })
			vim.keymap.set({ "n", "v" }, "<leader>ga", function()
				chat.ask("Show me something interesting", {
					callback = function(response)
						print("Response:", response)
					end,
				})
			end, { noremap = true })
		end,
	},
}
