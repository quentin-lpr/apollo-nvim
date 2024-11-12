-- A blazing fast and easy to configure neovim statusline
return {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPost",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local custom_iceberg_dark = require("lualine.themes.iceberg_dark")

		custom_iceberg_dark.normal.c.bg = "#0c0c0c"
		custom_iceberg_dark.inactive.c.bg = "#0c0c0c"

		require("lualine").setup({
			options = {
				theme = custom_iceberg_dark,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function()
							return ""
						end,
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						newfile_status = false,
						path = 4,
					},
				},
				lualine_x = { "encoding", "filetype" },
			},
			inactive_sections = {
				lualine_x = { "" },
			},
		})

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				vim.opt.laststatus = 0
			end,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				vim.opt.laststatus = 2
			end,
		})
	end,
}
