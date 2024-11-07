return {
  -- Add/change/delete surrounding delimiter pairs with ease
  {
    "kylechui/nvim-surround",
    event = "BufReadPre",
    version = "*",
    opts = {},
  },
  -- A Neovim plugin which acts as a helper or training aid for kylechui/nvim-surround
  {
    "roobert/surround-ui.nvim",
    event = "BufReadPre",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    opts = {
      root_key = "s",
    },
  },
}
