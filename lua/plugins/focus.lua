return {
	"cdmill/focus.nvim",
	event = "BufReadPre",
	config = function()
		require("focus").setup({
			auto_zen = true,
		})
		local builtin = require("focus")

		local wk = require("which-key")
		wk.add({ "<leader>z", "<Cmd>Focus<CR>", mode = "n", desc = "Toggle zen mode", icon = { icon = "", color = "white" } })
	end,
}
