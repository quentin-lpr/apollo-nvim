-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {},
  dependencies = {
    "rcarriga/nvim-notify",
  },
}
