-- A minimal and blazing fast indentline plugin
return {
  "nvimdev/indentmini.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require("indentmini").setup()
    vim.cmd.highlight("IndentLine guifg=#2c2c2c")
    vim.cmd.highlight("IndentLineCurrent guifg=#4c4c4c")
  end,
}
