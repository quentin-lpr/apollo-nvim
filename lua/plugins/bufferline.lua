-- A snazzy bufferline for Neovim
return {
	"akinsho/bufferline.nvim",
	event = "BufReadPre",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true

		local function toggle_bufferline()
			if vim.o.showtabline == 0 then
				vim.o.showtabline = 2
			else
				vim.o.showtabline = 0
			end
		end

		-- Keymaps
		local wk = require("which-key")
		wk.add({
			{ "<C-o>", "<Cmd>BufferLineCycleNext<CR>", mode = "n", desc = "Next buffer", icon = { icon = "", color = "white" } },
			{ "<C-i>", "<Cmd>BufferLineCyclePrev<CR>", mode = "n", desc = "Previous buffer", icon = { icon = "", color = "white" } },
			{ "<leader>bt", toggle_bufferline, mode = "n", desc = "Toggle bufferline", icon = { icon = "", color = "white" } },
			{ "<leader>bp", "<Cmd>BufferLinePick<CR>", mode = "n", desc = "Pick buffer", icon = { icon = "󰝁", color = "white" } },
		})

		require("bufferline").setup({
			options = {
				show_tab_indicators = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						separator = false,
						text_align = "center",
					},
				},
				show_close_icon = false,
				show_buffer_close_icons = false,
			},
		})

		-- local function update_bufferline()
		-- 	local buf_count = #vim.fn.getbufinfo({ buflisted = 1 })
		-- 	print("add")
		-- 	vim.opt.showtabline = (buf_count > 1) and 2 or 0
		-- end

		-- vim.api.nvim_create_autocmd({ "BufAdd", "BufRead" }, {
		-- 	callback = update_bufferline,
		-- })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.opt.showtabline = 0
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			buffer = 0,
			callback = function()
				vim.opt.showtabline = 2
			end,
		})
	end,
}
