return {
  "nvzone/floaterm",
  event = "VeryLazy",
  dependencies = "nvzone/volt",
  opts = {},
  config = function(_, opts)
    require("floaterm").setup(opts)
    local function next_term()
      require("floaterm.api").cycle_term_bufs("next")
    end

    local function prev_term()
      require("floaterm.api").cycle_term_bufs("prev")
    end

    local os_name = vim.loop.os_uname().sysname
    local wk = require("which-key")
    wk.add({
      { "<C-q>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
    })
    if os_name == "Darwin" then
      wk.add({
        { "@", "<Cmd>FloatermToggle<CR>", mode = { "n", "t" }, desc = "Toggle Terminal", icon = { icon = "", color = "white" } },
        { "<M-Up>", prev_term, mode = { "n", "t" }, desc = "Toggle Terminal", icon = { icon = "", color = "white" } },
        { "<M-Down>", next_term, mode = { "n", "t" }, desc = "Toggle Terminal", icon = { icon = "", color = "white" } },
      })
    else
      wk.add({
        { "²", "<Cmd>FloatermToggle<CR>", mode = { "n", "t" }, desc = "Toggle Terminal", icon = { icon = "", color = "white" } },
      })
    end
  end,
}
