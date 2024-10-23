return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		local shell
		if vim.fn.has("win32") == 1 then
			shell = "powershell"
		elseif vim.fn.has("macunix") == 1 then
			shell = "zsh"
		else
			shell = "sh"
		end

		require("toggleterm").setup({
			size = 70,
			shell = shell,
		})

		local Terminal = require("toggleterm.terminal").Terminal

		-- Lazygit Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			direction = "float",
			float_opts = { border = "double" },
			on_open = function()
				vim.cmd("startinsert!")
			end,
		})
		local function toggle_lazygit()
			lazygit:toggle()
		end

		vim.keymap.set("n", "<leader>lg", toggle_lazygit, { noremap = true, desc = "Show/Hide Lazygit Window" })

		-- Float Terminal
		local terminal = Terminal:new({
			direction = "float",
			float_opts = { border = "double" },
			on_open = function()
				vim.cmd("startinsert!")
			end,
		})
		local function toggle_terminal()
			terminal:toggle()
		end

		local os_name = vim.loop.os_uname().sysname
		if os_name == "Windows_NT" then
			vim.keymap.set({ "n", "t" }, "²", toggle_terminal, { noremap = true, desc = "Show/Hide Terminal" })
		elseif os_name == "Darwin" then
			vim.keymap.set({ "n", "t" }, "<C-<>", toggle_terminal, { noremap = true, desc = "Show/Hide Terminal" })
		end
	end,
}
