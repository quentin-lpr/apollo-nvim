return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},
  config = function()
    require("toggleterm").setup({
      size = 70,
    })

    local Terminal = require("toggleterm.terminal").Terminal

    -- Lazygit Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      float_opts = { border = "double" },
      on_open = function()
        vim.cmd("startinsert!")
      end,
    })
    local function toggle_lazygit()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>lg", toggle_lazygit, { noremap = true, desc = "Show/Hide Lazygit Window" })

    -- Right Terminal
    local terminal = Terminal:new({
      direction = "vertical",
      on_open = function()
        vim.cmd("startinsert!")
      end,
    })
    local function toggle_terminal()
      terminal:toggle()
    end

    vim.keymap.set({ "n", "t" }, "<C->>", toggle_terminal, { noremap = true, desc = "Show/Hide Terminal" })
    vim.keymap.set({ "n", "t" }, "²", toggle_terminal, { noremap = true, desc = "Show/Hide Terminal" })
  end,
}
