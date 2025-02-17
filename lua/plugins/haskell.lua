return {
  "mrcjkb/haskell-tools.nvim",
  version = "^4",
  event = "VeryLazy",
  config = function()
    local ht = require("haskell-tools")
    -- vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)
    local wk = require("which-key")
    wk.add({
      {
        group = "Haskell",
        "<leader>h",
        { "<leader>hd", ht.hoogle.hoogle_signature, mode = "n", desc = "Hoogle signature search", icon = { icon = "", color = "white" } },
        { "<leader>he", ht.lsp.buf_eval_all, mode = "n", desc = "Evaluate all code snippets", icon = { icon = "", color = "white" } },
        { "<leader>ht", ht.repl.toggle, mode = "n", desc = "Toggle a GHCi repl for the current package", icon = { icon = " ", color = "white" } },
        { "<leader>hq", ht.repl.quit, mode = "n", desc = "Quit", icon = { icon = "󰠚", color = "white" } },
        icon = { icon = "󰲒", color = "white" },
      },
    })
  end,
}
