return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local function multiopen(prompt_bufnr)
				local picker = action_state.get_current_picker(prompt_bufnr)
				local multi = picker:get_multi_selection()

				if not vim.tbl_isempty(multi) then
					actions.close(prompt_bufnr)
					for _, j in pairs(multi) do
						if j.path ~= nil then
							local path = vim.fn.fnameescape(j.path)
							if j.lnum ~= nil then
								vim.cmd(string.format("silent! edit +%d %s", j.lnum, path))
							else
								vim.cmd(string.format("silent! edit %s", path))
							end
						end
					end
				else
					actions.select_default(prompt_bufnr)
				end
			end

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<CR>"] = multiopen,
						},
						n = {
							["<CR>"] = multiopen,
						},
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { noremap = true, desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true, desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fs", builtin.grep_string, { noremap = true, desc = "Telescope grep string" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { noremap = true, desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { noremap = true, desc = "Telescope help tags" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { noremap = true, desc = "Telescope diagnostics" })
			vim.keymap.set("n", "<leader>ft", builtin.filetypes, { noremap = true, desc = "Telescope diagnostics" })
			vim.keymap.set("n", "<leader>fn", "<Cmd>Telescope notify<CR>", { noremap = true, desc = "Telescope notifications" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
