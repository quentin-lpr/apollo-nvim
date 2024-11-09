-- A multi-cursor plugin for Neovim that works in normal, insert/replace, or visual modes, and with almost every command
return {
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {},
    keys = {
      { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
      { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

      { "<C-S-a>", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },

      { "<C-n>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor and jump to next cword" },
      { "<C-S-n>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

      { "<C-S-l>", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
    },
  },
}
