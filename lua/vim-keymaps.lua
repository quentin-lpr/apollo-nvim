-- Toggle syntax highlighting
function ToggleAllSyntax()
  -- Toggle regular syntax highlighting
  if vim.g.syntax_on then
    vim.cmd("syntax off")
  else
    vim.cmd("syntax on")
  end

  -- Toggle Treesitter highlighting
  vim.cmd("TSToggle highlight")
end

vim.keymap.set("n", "<leader>h", ToggleAllSyntax, { noremap = true, desc = "Toggle All Syntax Highlighting" })

-- Copy/Paste inside '*' register (macOS)
vim.keymap.set("v", "<C-c>", '"*y', { noremap = true, desc = "Copy to macOS clipboard" })
vim.keymap.set({ "n", "i" }, "<C-v>", '<Esc>"*p', { noremap = true, desc = "Paste from macOS clipboard" })

-- Buffer handling
vim.keymap.set({ "n", "i" }, "<C-n>", "<Cmd>enew<CR><Esc>", { noremap = true, desc = "Create a new empty buffer" })
vim.keymap.set({ "n", "i" }, "<C-x>", "<Cmd>bdelete<CR><Esc>", { noremap = true, desc = "Delete current buffer" })
vim.keymap.set({ "n", "t" }, "<C-h>", "<C-\\><C-n><C-W>h", { noremap = true, desc = "Move to left window" })
vim.keymap.set({ "n", "t" }, "<C-j>", "<C-\\><C-n><C-W>j", { noremap = true, desc = "Move to bottom window" })
vim.keymap.set({ "n", "t" }, "<C-k>", "<C-\\><C-n><C-W>k", { noremap = true, desc = "Move to top window" })
vim.keymap.set({ "n", "t" }, "<C-l>", "<C-\\><C-n><C-W>l", { noremap = true, desc = "Move to right window" })

-- Code
vim.keymap.set({ "n", "i" }, "<M-CR>", "<Esc>gg=G", { noremap = true, desc = "Reindent entire file" })

-- Others
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "Exit terminal mode" })
vim.keymap.set({ "n", "v" }, "<leader>*", "<Cmd>noh<CR>", { noremap = true, desc = "Remove text highlight after searching" })
