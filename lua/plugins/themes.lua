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
				-- specs = {
				-- github_dark_high_contrast = {
				-- syntax = {
				-- 	operator = "#00ff00",
				-- },
				-- bg0 = "bg0",
				-- bg1 = "bg1",
				-- bg2 = "bg2",
				-- bg3 = "bg3",
				-- bg4 = "bg4",
				-- fg3 = "fg3",
				-- sel1 = "sel1",
				-- sel2 = "sel2",
				-- },
				-- },
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
						base = "#0d1117",
					},
				},
			},
      -- Imitation of github theme using catppuccin
			-- color_overrides = {
			-- 	all = {
			-- 		base = "#0d1117",
			-- 		yellow = "#ffa657",
			-- 		green = "#79c0ff",
			-- 		mauve = "#ff7b72",
			-- 		maroon = "#bac2de",
			--         -- teal = "#ffa657"
			-- 	},
			-- },
			-- custom_highlights = function()
			-- 	return {
			-- 		["@tag.tsx"] = { fg = "#ff7b72" },
			-- 		["@tag.builtin.tsx"] = { fg = "#ff7b72" },
			-- 	}
			-- end,
		},
	},
}
