return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  config = function()
    require("trouble").setup()

    local wk = require("which-key")
    wk.add({
      group = "Trouble",
      "<leader>t",
      { "<leader>tt", "<Cmd>Trouble diagnostics toggle<CR>", mode = "n", desc = "Toggle diagnostics" },
    })
  end,
}
