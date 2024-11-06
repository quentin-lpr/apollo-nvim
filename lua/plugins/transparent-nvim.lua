return {
  "xiyaowong/transparent.nvim",
  config = function()
    local transparent = require("transparent")
    local notify = require("notify")

    transparent.setup()

    local function toggle_transparency()
      transparent.toggle()
      notify("Transparency toggled", "info", { title = "Transparent.nvim" })
    end

    local wk = require("which-key")
    wk.add({ "<leader>t", toggle_transparency, mode = "n", desc = "Toggle transparency", icon = { icon = "󰂵", color = "white" } })
  end,
}
