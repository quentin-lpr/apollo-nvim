return {
	"m4xshen/smartcolumn.nvim",
	event = "BufReadPre",
	config = function()
		require("smartcolumn").setup({
			colorcolumn = "160",
			disabled_filetypes = { "alpha", "lazy", "help" },
		})
		vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1c1c1c" })
	end,
}
