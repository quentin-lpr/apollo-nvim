return {
  -- Neovim plugin to animate common Neovim actions
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.animate").setup({
        cursor = {
          timing = function(_, n)
            return 25 / n
          end,
        },
        scroll = {
          timing = function(_, n)
            return 50 / n
          end,
        },
        resize = {
          timing = function(_, n)
            return 25 / n
          end,
        },
        open = {
          timing = function(_, n)
            return 25 / n
          end,
        },
        close = {
          timing = function(_, n)
            return 25 / n
          end,
        },
      })
    end,
  },
  -- Neovim plugin to align text interactively
  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    version = false,
    config = function()
      require("mini.align").setup()
    end,
  },
}
