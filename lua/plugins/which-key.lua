return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("which-key").setup({
      preset = "helix",
      icons = {
        group = " ",
        ellipsis = "…",
        mappings = true,
        rules = {},
        colors = true,
      },
      mappings = true,
    })
    vim.keymap.set("n", "<leader>?", "<Cmd>WhichKey<CR>", { noremap = true, desc = "Show Local Keymaps (which-key)" })
  end,
}
