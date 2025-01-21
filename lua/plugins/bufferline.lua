-- A snazzy bufferline for Neovim
return {
  "akinsho/bufferline.nvim",
  event = "BufReadPre",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true

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
      { "<C-o>", "<Cmd>BufferLineCycleNext<CR>", mode = "n", desc = "Next buffer", icon = { icon = "", color = "white" } },
      { "<C-i>", "<Cmd>BufferLineCyclePrev<CR>", mode = "n", desc = "Previous buffer", icon = { icon = "", color = "white" } },
      { "<leader>bt", toggle_bufferline, mode = "n", desc = "Toggle bufferline", icon = { icon = "", color = "white" } },
      { "<leader>bp", "<Cmd>BufferLinePick<CR>", mode = "n", desc = "Pick buffer", icon = { icon = "󰝁", color = "white" } },
    })

    require("bufferline").setup({
      highlights = {
        buffer_selected = {
          underline = true,
          sp = "#51a0cf",
        },
        indicator_selected = {
          underline = true,
          sp = "#51a0cf",
        },
      },
      options = {
        indicator = {
          style = "underline",
        },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = false,
            text_align = "center",
          },
        },
        show_close_icon = false,
        show_buffer_close_icons = false,
      },
    })

    -- Hide the bufferline
    vim.opt.showtabline = 0
  end,
}
