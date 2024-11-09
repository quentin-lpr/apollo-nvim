return {
  -- Add/change/delete surrounding delimiter pairs with ease
  {
    "kylechui/nvim-surround",
    event = "InsertEnter",
    version = "*",
    opts = {},
  },
  -- A Neovim plugin which acts as a helper or training aid for kylechui/nvim-surround
  {
    "roobert/surround-ui.nvim",
    event = "InsertEnter",
    dependencies = {
      "kylechui/nvim-surround",
      "folke/which-key.nvim",
    },
    opts = {
      root_key = "s",
    },
  },
}
