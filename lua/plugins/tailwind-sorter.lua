return {
	"laytan/tailwind-sorter.nvim",
	event = "BufReadPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
	},
	build = "cd formatter && npm ci && npm run build",
	config = function()
		require("tailwind-sorter").setup()
		-- vim.cmd("TailwindSortOnSaveToggle")
	end,
}
