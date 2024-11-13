-- A fork of Folke's zen mode with features from True Zen. Customized to my workflow
return {
  "cdmill/focus.nvim",
  event = "VeryLazy",
  config = function()
    require("focus").setup({
      auto_zen = true,
    })

    local wk = require("which-key")
    wk.add({ "<leader>z", "<Cmd>Focus<CR>", mode = "n", desc = "Toggle zen mode", icon = { icon = "", color = "white" } })
  end,
}
