return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = "nvimtools/none-ls-extras.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--column-width",
            "195",
          },
        }),
        -- require("none-ls.diagnostics.eslint_d"),
      },
    })

    local wk = require("which-key")
    wk.add({
      { "<leader>bf", vim.lsp.buf.format, mode = "n", desc = "Format buffer", icon = { icon = "󰉼", color = "white" } },
    })
  end,
}
