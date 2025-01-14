-- Neovim plugin to manage the file system and other tree like structures
return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "VeryLazy",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 25,
        mappings = {
          ["H"] = "toggle_hidden",
          ["<tab>"] = "open",
          ["l"] = "set_root",
          ["h"] = "navigate_up",
          ["<C-k>"] = { "scroll_preview", config = { direction = 2 } },
          ["<C-j>"] = { "scroll_preview", config = { direction = -2 } },
          ["s"] = "open_rightbelow_vs",
        },
      },
    })

    local os_name = vim.loop.os_uname().sysname
    local wk = require("which-key")
    wk.add({
      { "<leader>e", "<Cmd>Neotree focus<CR><Esc>", mode = "n", desc = "Focus neo-tree", icon = { icon = "󰙅", color = "white" } },
    })
    if os_name == "Darwin" then
      wk.add({
        { "<leader>@", "<Cmd>Neotree toggle left<CR><Esc>", mode = "n", desc = "Show Nvim File Tree", icon = { icon = "󰙅", color = "white" } },
      })
    else
      wk.add({
        { "<leader>²", "<Cmd>Neotree toggle left<CR><Esc>", mode = "n", desc = "Show Nvim File Tree", icon = { icon = "󰙅", color = "white" } },
      })
    end
  end,
}
