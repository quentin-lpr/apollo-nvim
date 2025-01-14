-- A neovim plugin to help easily manage multiple terminal windows
return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  version = "*",
  opts = {},
  config = function()
    local shell
    if vim.fn.has("win32") == 1 then
      shell = "powershell"
    else
      shell = "zsh"
    end

    require("toggleterm").setup({
      size = 70, -- Change this value to adjust width when terminal is vertical
      shell = shell,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Lazygit Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      float_opts = { border = "curved" },
      on_open = function()
        vim.cmd("startinsert!")
      end,
    })
    local function toggle_lazygit()
      lazygit:toggle()
    end

    -- Float Terminal
    local terminal = Terminal:new({
      direction = "float",
      float_opts = { border = "curved" },
      on_open = function()
        vim.cmd("startinsert!")
      end,
    })
    local function toggle_terminal()
      terminal:toggle()
    end

    local os_name = vim.loop.os_uname().sysname
    local wk = require("which-key")
    wk.add({
      { "<leader>lg", toggle_lazygit, mode = "n", desc = "Toggle Lazygit Window", icon = { icon = "", color = "white" } },
      { "<C-q>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
    })
    if os_name == "Darwin" then
      wk.add({
        { "@", toggle_terminal, mode = { "n", "t" }, desc = "Toggle Terminal", icon = { icon = "", color = "white" } },
      })
    else
      wk.add({
        { "²", toggle_terminal, mode = { "n", "t" }, desc = "Toggle Terminal", icon = { icon = "", color = "white" } },
      })
    end
  end,
}
