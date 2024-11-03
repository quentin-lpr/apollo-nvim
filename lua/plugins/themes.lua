return {
	-- GitHub's Neovim themes
	{
		"projekt0n/github-nvim-theme",
		lazy = true,
		name = "github-theme",
		priority = 1000,
		opts = {},
		config = function()
			require("github-theme").setup({
				options = {
					styles = {
						comments = "italic",
					},
				},
			})
		end,
	},
	-- Catppuccin's Neovim themes
	{
		{
			"catppuccin/nvim",
			lazy = true,
			name = "catppuccin",
			priority = 1000,
			opts = {
				color_overrides = {
					all = {
						base = "#0c0c0c",
					},
				},
				integrations = {
					alpha = true,
				},
				custom_highlights = function()
					return {
						AlphaHeader = { fg = "#818596" },
					}
				end,
			},
		},
	},
}
