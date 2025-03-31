return {
  -- Plugin to easily install and manage LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    lazy = false,
    priority = 100,
    opts = {},
  },
  -- Install and upgrade third party tools automatically
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "BufReadPre",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "biome",
          "clangd",
          "lua-language-server",
          "stylua",
          "tailwindcss-language-server",
          "typescript-language-server",
          "clang-format",
          "asm-lsp",
          "cmake-language-server",
          "codelldb",
          "docker-compose-language-service",
          "dockerfile-language-server",
        },
      })
      vim.cmd("MasonToolsClean")
      vim.cmd("MasonToolsUpdate")
    end,
  },
  -- Quickstart configs for Nvim LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- lspconfig.sourcekit.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          ["typescript.preferences.importModuleSpecifier"] = "non-relative",
        },
        -- handlers = {
        --   ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
        --     local allowed_code = 2304
        --     local filtered_diagnostics = {}
        --
        --     for _, diagnostic in ipairs(result.diagnostics) do
        --       if diagnostic.code == allowed_code then
        --         table.insert(filtered_diagnostics, diagnostic)
        --       end
        --     end
        --
        --     result.diagnostics = filtered_diagnostics
        --
        --     vim.lsp.handlers["textDocument/publishDiagnostics"](_, result, ctx, config)
        --   end,
        -- },
        -- Disable ts_ls diagnostics while keeping completion snippets
        -- handlers = {
        --   ["textDocument/publishDiagnostics"] = function() end,
        -- },
      })
      lspconfig.biome.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.asm_lsp.setup({ capabilities = capabilities })
      lspconfig.cmake.setup({ capabilities = capabilities })
      lspconfig.docker_compose_language_service.setup({ capabilities = capabilities, filetypes = { "yaml.docker-compose" } })
      lspconfig.dockerls.setup({ capabilities = capabilities })

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
          { "<leader>la", vim.lsp.buf.code_action, mode = { "n", "v" }, desc = "Code actions", icon = { icon = "", color = "white" } },
          { "<leader>lr", vim.lsp.buf.rename, mode = "n", desc = "Rename", icon = { icon = "󰑕", color = "white" } },
          { "<leader>lu", "<Cmd>Telescope lsp_references<CR>", mode = "n", desc = "Usages", icon = { icon = "", color = "white" } },
          icon = { icon = "", color = "white" },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        update_in_insert = true,
      })
    end,
  },
}
