return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    current_line_blame_opts = {
      delay = 0,
    },
    current_line_blame_formatter = "   <author>, <author_time:%R> - <summary>",

    -- Keymaps
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      local wk = require("which-key")
      wk.add({
        {
          group = "Git",
          "<leader>g",
          { "<leader>gt", gitsigns.toggle_signs, mode = "n", desc = "Toggle diff line", icon = { icon = "", color = "white" } },
          { "<leader>gR", gitsigns.reset_buffer, mode = "n", desc = "Reset buffer", icon = { icon = "󰁯", color = "white" } },
          { "<leader>gb", gitsigns.toggle_current_line_blame, mode = "n", desc = "Toggle line blame", icon = { icon = "", color = "white" } },
          { "<leader>gl", gitsigns.toggle_deleted, mode = "n", desc = "Toggle deleted diffs", icon = { icon = "", color = "white" } },
          { "<leader>gh", gitsigns.preview_hunk, mode = "n", desc = "Preview hunk", icon = { icon = "󰈈", color = "white" } },
          { "<leader>gN", gitsigns.prev_hunk, mode = "n", desc = "Prev hunk", icon = { icon = "󰒮", color = "white" } },
          { "<leader>gn", gitsigns.next_hunk, mode = "n", desc = "Next hunk", icon = { icon = "󰒭", color = "white" } },
          { "<leader>gr", gitsigns.reset_hunk, mode = "n", desc = "Reset hunk", icon = { icon = "󰁯", color = "white" } },
          {
            "<leader>gd",
            function()
              gitsigns.diffthis(nil, {
                vertical = true,
                split = "botright",
              })
            end,
            mode = "n",
            desc = "Diff",
            icon = { icon = "", color = "white" },
          },
        },
      })
    end,
  },
}
