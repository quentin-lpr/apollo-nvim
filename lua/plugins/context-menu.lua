return {
	"nvzone/menu",
	event = "VeryLazy",
	config = function()
		local function open_menu()
			require("menu").open("default")
		end

		local wk = require("which-key")
		wk.add({
			{ "<C-c>", open_menu, mode = { "n", "t" }, desc = "Open context menu", icon = { icon = "󰍜", color = "white" } },
		})
	end,
}
