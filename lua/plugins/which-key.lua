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
				rules = {
					{ plugin = "telescope.nvim", pattern = "telescope", icon = "", color = "white" },
				},
				colors = true,
			},
			mappings = true,
		})

		wk.add({ "<leader>?", "<Cmd>WhichKey<CR>", desc = "Show local keymaps", icon = { icon = "󰋖", color = "white" } })
	end,
}
