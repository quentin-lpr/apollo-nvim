-- Simple session management for Neovim
return {
  "folke/persistence.nvim",
  enabled = false,
  event = "BufReadPre",
  opts = {},
  config = function()
    require("persistence").setup({
      dir = vim.fn.stdpath("state") .. "/sessions/",
      need = 1,
      branch = true,
    })
    local builtin = require("persistence")

    local wk = require("which-key")
    wk.add({
      {
        group = "Session",
        "<leader>q",
        -- { "<leader>qs", builtin.load,   mode = "n", desc = "Load last session" },
        { "<leader>qS", builtin.select, mode = "n", desc = "Select session to load" },
        { "<leader>ql", builtin.load,   mode = "n", desc = "Load last session" },
        { "<leader>qd", builtin.stop,   mode = "n", desc = "Stop persistence" },
        icon = { icon = "", color = "white" },
      },
    })
  end,
}
