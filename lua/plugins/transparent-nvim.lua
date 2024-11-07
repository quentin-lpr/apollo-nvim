return {
  "xiyaowong/transparent.nvim",
  config = function()
    local transparent = require("transparent")
    transparent.setup()

    local wk = require("which-key")
    wk.add({ "<leader>t", transparent.toggle, mode = "n", desc = "Toggle transparency", icon = { icon = "󰂵", color = "white" } })
  end,
}
