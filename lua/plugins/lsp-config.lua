return {
  -- Plugin to easily install and manage LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- Install and upgrade third party tools automatically
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "biome",
          "clangd",
          "lua-language-server",
          "stylua",
          "tailwindcss-language-server",
          "typescript-language-server",
        },
      })
      vim.cmd("MasonToolsClean")
      vim.cmd("MasonToolsUpdate")
    end,
  },
  -- Quickstart configs for Nvim LSP
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        -- Disable ts_ls diagnostics while keeping completion snippets
        -- handlers = {
        --   ["textDocument/publishDiagnostics"] = function() end,
        -- },
      })
      lspconfig.biome.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })

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

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = false,
        update_in_insert = true,
        underline = true,
      })
    end,
  },
}
