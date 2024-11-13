-- A simple popup display that provides breadcrumbs feature using LSP serve
return {
  "SmiteshP/nvim-navbuddy",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
    "numToStr/Comment.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("nvim-navbuddy").setup({
      window = {
        border = "rounded",
      },
      lsp = {
        auto_attach = true,
      },
    })

    local wk = require("which-key")
    wk.add({
      { "<leader>n", "<Cmd>Navbuddy<CR>", mode = "n", desc = "Open navbuddy", icon = { icon = "󱣻", color = "white" } },
    })
  end,
}
