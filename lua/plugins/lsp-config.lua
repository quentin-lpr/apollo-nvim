return {
  -- Plugin to easily install and manage LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim (primarily used to ensure that the LSP servers are installed)
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
      ensure_installed = { "lua_ls", "ts_ls" },
    },
  },
  -- Quickstart configs for Nvim LSP
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      { "ms-jpq/coq_nvim",       branch = "coq" },
      { "ms-jpq/coq.artifacts",  branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
    },
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up",
      }
    end,
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

      local wk = require("which-key")
      wk.add({
        {
          group = "LSP",
          "<leader>l",
          { "<leader>lt", toggle_diagnostics, mode = "n", desc = "Toggle LSP", icon = { icon = "", color = "white" } },
          { "<leader>li", vim.lsp.buf.hover, mode = "n", desc = "Displays information", icon = { icon = "", color = "white" } },
          { "<leader>ld", vim.lsp.buf.definition, mode = "n", desc = "Jumps to definition", icon = { icon = "", color = "white" } },
          { "<leader>la", vim.lsp.buf.code_action, mode = "n", desc = "Code actions", icon = { icon = "", color = "white" } },
          { "<leader>lr", vim.lsp.buf.rename, mode = "n", desc = "Rename", icon = { icon = "󰑕", color = "white" } },
          icon = { icon = "", color = "white" },
        },
      })
    end,
  },
}
