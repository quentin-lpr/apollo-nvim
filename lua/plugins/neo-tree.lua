return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 25,
				mappings = {
					["H"] = "toggle_hidden",
					["<tab>"] = "open",
					["l"] = "set_root",
					["h"] = "navigate_up",
					["<C-k>"] = { "scroll_preview", config = { direction = 2 } },
					["<C-j>"] = { "scroll_preview", config = { direction = -2 } },
					["s"] = "open_rightbelow_vs",
				},
			},
		})
		vim.keymap.set({ "n", "i" }, "<C-@>", "<Cmd>Neotree toggle left<CR><Esc>", { noremap = true, desc = "Show Nvim File Tree" })
		vim.keymap.set("n", "<leader>e", "<Cmd>Neotree focus<CR><Esc>", { noremap = true, desc = "Focus neo-tree" })
	end,
}
