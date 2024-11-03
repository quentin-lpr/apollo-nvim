-- A blazing fast and easy to configure neovim statusline
return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			theme = "iceberg_dark",
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
	},
}
