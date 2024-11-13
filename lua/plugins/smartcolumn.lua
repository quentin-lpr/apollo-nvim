-- A Neovim plugin hiding your colorcolumn when unneeded.
return {
  "m4xshen/smartcolumn.nvim",
  event = "VeryLazy",
  config = function()
    require("smartcolumn").setup({
      colorcolumn = "160",
      disabled_filetypes = { "alpha", "lazy", "help" },
    })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#121212" })
  end,
}
