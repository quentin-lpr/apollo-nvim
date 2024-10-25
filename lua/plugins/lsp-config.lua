return {
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
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
				{ "<leader>lsp", toggle_diagnostics, mode = "n", desc = "Enable/Disable LSP", icon = { icon = "", color = "white" } },
				{ "K", vim.lsp.buf.hover, mode = "n", desc = "Displays information under the cursor" },
				{ "gd", vim.lsp.buf.definition, mode = "n", desc = "Jumps to the definition" },
				{ "<leader>ca", vim.lsp.buf.code_action, mode = "n", desc = "Code actions" },
				{ "<leader>r", vim.lsp.buf.rename, mode = "n", desc = "Rename", icon = { icon = "󰑕", color = "white" } },
			})
		end,
	},
}
