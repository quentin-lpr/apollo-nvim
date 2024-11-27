-- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing
return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  config = function()
    require("trouble").setup({
      auto_close = true,
    })

    local wk = require("which-key")
    wk.add({
      group = "Trouble",
      "<leader>t",
      { "<leader>tt", "<Cmd>Trouble diagnostics toggle<CR>", mode = "n", desc = "Toggle diagnostics" },
      { "<leader>tf", "<Cmd>Trouble diagnostics focus<CR>", mode = "n", desc = "Focus" },
      icon = { icon = "", color = "white" },
    })
  end,
}
