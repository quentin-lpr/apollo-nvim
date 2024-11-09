-- WhichKey helps you remember your Neovim keymaps, by showing available keybindings in a popup as you type
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      icons = {
        group = "",
        rules = {
          { pattern = "surround", icon = "󰅪", color = "white" },
          { pattern = "cursor", icon = "", color = "white" },
        },
      },
    })

    wk.add({ "<leader>?", "<Cmd>WhichKey<CR>", desc = "Show local keymaps", icon = { icon = "󰋖", color = "white" } })
  end,
}
