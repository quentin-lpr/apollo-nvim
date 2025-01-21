return {
  "romgrk/barbar.nvim",
  event = "VeryLazy",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    auto_hide = 1,
    exclude_ft = { "alpha" },
    sidebar_filetypes = {
      ["neo-tree"] = {
        text = "File Explorer",
        align = "center",
      },
    },
  },
  config = function(_, opts)
    require("barbar").setup(opts)
    local function toggle_bufferline()
      if vim.o.showtabline == 0 then
        vim.o.showtabline = 2
      else
        vim.o.showtabline = 0
      end
    end

    -- Keymaps
    local wk = require("which-key")
    wk.add({
      { "<C-u>", "<Cmd>BufferPrevious<CR>", mode = "n", desc = "Previous buffer", icon = { icon = "", color = "white" } },
      { "<C-i>", "<Cmd>BufferNext<CR>", mode = "n", desc = "Next buffer", icon = { icon = "", color = "white" } },
      { "<leader>bt", toggle_bufferline, mode = "n", desc = "Toggle bufferline", icon = { icon = "", color = "white" } },
      { "<leader>bp", "<Cmd>BufferLinePick<CR>", mode = "n", desc = "Pick buffer", icon = { icon = "󰝁", color = "white" } },
      { "<C-x>", "<Cmd>BufferClose<CR>", mode = { "n", "i" }, desc = "Delete current buffer", icon = { icon = "󱧖", color = "white" } },
    })
  end,
}
