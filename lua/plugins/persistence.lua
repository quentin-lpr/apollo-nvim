-- Simple session management for Neovim
return {
  "folke/persistence.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = {},
  config = function()
    require("persistence").setup({
      dir = vim.fn.stdpath("state") .. "/sessions/",
      need = 1,
      branch = true,
    })
    local persistence = require("persistence")

    local wk = require("which-key")
    wk.add({
      {
        group = "Session",
        "<leader>q",
        -- { "<leader>qs", builtin.load,   mode = "n", desc = "Load last session" },
        { "<leader>qS", persistence.select, mode = "n", desc = "Select session to load" },
        { "<leader>ql", persistence.load, mode = "n", desc = "Load last session" },
        { "<leader>qd", persistence.stop, mode = "n", desc = "Stop persistence" },
        icon = { icon = "", color = "white" },
      },
    })
  end,
}
