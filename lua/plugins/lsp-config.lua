return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})

      local function toggle_diagnostics()
        if vim.diagnostic.is_disabled() then
          vim.diagnostic.enable()
        else
          vim.diagnostic.disable()
        end
      end
      vim.keymap.set("n", "<leader>lsp", toggle_diagnostics, { noremap = true, desc = "Enable/Disable LSP" })
      vim.keymap.set("n","K", vim.lsp.buf.hover, { noremap = true, desc = "Displays hover information about the symbol under the cursor" })
      vim.keymap.set("n","gd",vim.lsp.buf.definition, { noremap = true, desc = "Jumps to the definition of the symbol under the cursor" })
      vim.keymap.set("n","<leader>ca",vim.lsp.buf.code_action, { noremap = true, desc = "Selects a code action available at the current cursor position" })
      vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, { noremap = true, desc = "Rename word under cursor" })
    end,
  },
}
