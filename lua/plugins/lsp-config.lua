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
          -- "biome",
          "eslint-lsp",
          "clangd",
          "lua-language-server",
          "stylua",
          "tailwindcss-language-server",
          "typescript-language-server",
          "clang-format",
          -- "asm-lsp",
          "cmake-language-server",
          "codelldb",
          -- "haskell-debug-adapter",
          -- "haskell-language-server",
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

      vim.lsp.config("*", {
        on_attach = function(client, bufnr)
          if client.name == "eslint" then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end
        end,
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        settings = {
          ["typescript.preferences.importModuleSpecifier"] = "non-relative",
        },
      })
      vim.lsp.config("eslint", {
        capabilities = capabilities,
        settings = { workingDirectories = { mode = "auto" } },
        root_markers = { ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js", "package.json" },
      })
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })
      vim.lsp.config("cmake", {
        capabilities = capabilities,
      })
      vim.lsp.config("docker_compose_language_service", {
        capabilities = capabilities,
        filetypes = { "yaml.docker-compose" },
      })
      vim.lsp.config("dockerls", {
        capabilities = capabilities,
      })

      vim.lsp.enable("clangd")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("cmake")
      vim.lsp.enable("docker_compose_language_service")
      vim.lsp.enable("dockerls")

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
