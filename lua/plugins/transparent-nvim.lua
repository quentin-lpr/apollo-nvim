-- Remove all background colors to make nvim transparent
return {
  "xiyaowong/transparent.nvim",
  config = function()
    local transparent = require("transparent")
    transparent.setup()

    local wk = require("which-key")
    wk.add({ "<C-t>", transparent.toggle, mode = "n", desc = "Toggle transparency", icon = { icon = "󰂵", color = "white" } })
  end,
}
