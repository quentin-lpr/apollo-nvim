-- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
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
        null_ls.builtins.formatting.clang_format.with({
          extra_args = {
            "-i",
          },
        }),
        -- require("none-ls.diagnostics.eslint_d"),
      },
    })
  end,
}
