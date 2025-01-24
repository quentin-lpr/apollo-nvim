function FormatAndReindent()
  vim.lsp.buf.format()
  vim.cmd("normal! gg=G")
end

local wk = require("which-key")
wk.add({
  -- Copy/Paste inside '*' register
  { "<C-c>", '"*y', mode = "v", desc = "Copy to clipboard", icon = { icon = "", color = "white" } },
  { "<C-v>", '<Esc>"*p', mode = { "n", "i" }, desc = "Paste from clipboard", icon = { icon = "", color = "white" } },

  -- Buffer handling
  { "<C-s>", "<Cmd>w<CR><Esc>", mode = { "n", "i", "v" }, desc = "Save", icon = { icon = "󰆓", color = "white" } },
  { "<F5>", "<Cmd>e<CR><Esc>", mode = { "n", "i", "v" }, desc = "Refresh file", icon = { icon = "", color = "white" } },
  -- { "<C-n>", "<Cmd>enew<CR><Esc>", mode = { "n", "i" }, desc = "Create a new empty buffer", icon = { icon = "󱧕", color = "white" } },
  { "<C-h>", "<C-\\><C-n><C-W>h", mode = { "n", "t" }, desc = "Move to left window", icon = { icon = "", color = "white" } },
  { "<C-j>", "<C-\\><C-n><C-W>j", mode = { "n", "t" }, desc = "Move to bottom window", icon = { icon = "", color = "white" } },
  { "<C-k>", "<C-\\><C-n><C-W>k", mode = { "n", "t" }, desc = "Move to top window", icon = { icon = "", color = "white" } },
  { "<C-l>", "<C-\\><C-n><C-W>l", mode = { "n", "t" }, desc = "Move to right window", icon = { icon = "", color = "white" } },
  {
    group = "Buffer",
    "<leader>b",
    { "<leader>bf", vim.lsp.buf.format, mode = "n", desc = "Format buffer", icon = { icon = "󰉼", color = "white" } },
    { "<leader>bF", FormatAndReindent, mode = "n", desc = "Format + reindent buffer", icon = { icon = "󰉼", color = "white" } },
    {
      group = "Sort",
      "<leader>bs",
      { "<leader>bsn", "<Cmd>BufferOrderByName<CR>", mode = "n", desc = "By Name", icon = { icon = " ", color = "white" } },
      { "<leader>bsd", "<Cmd>BufferOrderByDirectory<CR>", mode = "n", desc = "By Directory", icon = { icon = " ", color = "white" } },
      { "<leader>bsl", "<Cmd>BufferOrderByLanguage<CR>", mode = "n", desc = "By Language", icon = { icon = " ", color = "white" } },
      icon = { icon = " ", color = "white" },
    },
    icon = { icon = "󰈔", color = "white" },
  },
  -- { "<M-CR>", "<Esc>gg=G", mode = { "n", "i" }, desc = "Reindent entire file", icon = { icon = "󰉼", color = "white" } },

  -- Code
  { "u", "<Cmd>undo<CR>", mode = "n", desc = "Undo", icon = { icon = "󰕌", color = "white" } },
  { "<C-r>", "<Cmd>redo<CR>", mode = "n", desc = "Redo", icon = { icon = "󰑎", color = "white" } },

  -- Others
  { "<Esc>", "<Cmd>noh<CR>", mode = "n", desc = "Remove text highlight after searching", icon = { icon = "󰸱", color = "white" } },
})
