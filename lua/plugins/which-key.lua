-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
			icons = {
				group = "",
				ellipsis = "…",
				mappings = true,
				rules = {},
				colors = true,
			},
			mappings = true,
		})

		wk.add({ "<leader>?", "<Cmd>WhichKey<CR>", desc = "Show local keymaps", icon = { icon = "󰋖", color = "white" } })
		wk.add({ "<leader>p", "<Cmd>WhichKey<CR>", desc = "Prev text" })
		wk.add({ "<leader>k", "<Cmd>WhichKey<CR>", desc = "terminal text" })
	end,
}
