-- A blazing fast and easy to configure neovim statusline
return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			theme = "iceberg_dark",
		},
		sections = {
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
