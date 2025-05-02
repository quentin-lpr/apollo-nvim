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
            mantle = "#131313",
            crust = "#1c1c1c",
            surface1 = "#2c2c2c",
          },
        },
        integrations = {
          alpha = true,
        },
        custom_highlights = function()
          return {
            AlphaHeader = { fg = "#818596" },
            Folded = {
              bg = "#0f0f0f",
            },
          }
        end,
      },
      config = function(_, opts)
        require("catppuccin").setup(opts)

        local colors = require("catppuccin.palettes").get_palette()
        local TelescopeColor = {
          TelescopeMatching = { fg = colors.flamingo },
          TelescopeSelection = { fg = colors.text, bg = colors.crust, bold = true },

          TelescopePromptPrefix = { bg = colors.mantle },
          TelescopePromptNormal = { bg = colors.mantle },
          TelescopeResultsNormal = { bg = colors.mantle },
          TelescopePreviewNormal = { bg = colors.crust },
          TelescopePromptBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
          TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
          TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
          TelescopeResultsTitle = { fg = colors.mantle },
          TelescopePreviewTitle = { bg = colors.green, fg = colors.crust },
        }

        for hl, col in pairs(TelescopeColor) do
          vim.api.nvim_set_hl(0, hl, col)
        end
      end,
    },
  },
}
