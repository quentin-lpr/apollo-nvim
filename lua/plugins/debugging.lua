return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			local wk = require("which-key")
			wk.add({
				{
					group = "Debug",
					"<leader>d",
					{ "<leader>db", dap.toggle_breakpoint, mode = "n", desc = "Toggle breakpoint", icon = { icon = "", color = "white" } },
					{ "<leader>dc", dap.continue, mode = "n", desc = "Continue", icon = { icon = "", color = "white" } },
					{ "<F12>", dap.step_over, mode = "n", desc = "Step over", icon = { icon = "", color = "white" } },
					{ "<F11>", dap.step_into, mode = "n", desc = "Step into", icon = { icon = "", color = "white" } },
					{ "<F10>", dap.step_out, mode = "n", desc = "Step out", icon = { icon = "", color = "white" } },
					{ "<leader>dr", dap.run_to_cursor, mode = "n", desc = "Run to cursor", icon = { icon = "", color = "white" } },
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		opts = {
			handlers = {},
		},
	},
}
