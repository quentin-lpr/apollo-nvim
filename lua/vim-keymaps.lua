-- Toggle syntax highlighting
function ToggleAllSyntax()
	-- Toggle regular syntax highlighting
	if vim.g.syntax_on then
		vim.cmd("syntax off")
	else
		vim.cmd("syntax on")
	end

	-- Toggle Treesitter highlighting
	vim.cmd("TSToggle highlight")
end

local wk = require("which-key")
wk.add({
	{ "<leader>h", ToggleAllSyntax, mode = "n", desc = "Toggle All Syntax Highlighting", icon = { icon = "󰠠", color = "white" } },

	-- Copy/Paste inside '*' register (macOS)
	{ "<C-c>", '"*y', mode = "v", desc = "Copy to macOS clipboard" },
	{ "<C-v>", '<Esc>"*p', mode = { "n", "i" }, desc = "Paste from macOS clipboard" },

	-- Buffer handling
	{ "<C-n>", "<Cmd>enew<CR><Esc>", mode = { "n", "i" }, desc = "Create a new empty buffer" },
	{ "<C-x>", "<Cmd>bdelete<CR><Esc>", mode = { "n", "i" }, desc = "Delete current buffer" },
	{ "<C-h>", "<C-\\><C-n><C-W>h", mode = { "n", "t" }, desc = "Move to left window" },
	{ "<C-j>", "<C-\\><C-n><C-W>j", mode = { "n", "t" }, desc = "Move to bottom window" },
	{ "<C-k>", "<C-\\><C-n><C-W>k", mode = { "n", "t" }, desc = "Move to top window" },
	{ "<C-l>", "<C-\\><C-n><C-W>l", mode = { "n", "t" }, desc = "Move to right window" },

	-- Code
	{ "<M-CR>", "<Esc>gg=G", mode = { "n", "i" }, desc = "Reindent entire file" },
	{ "u", "<Cmd>undo<CR>", mode = "n", desc = "Undo" },
	{ "<C-r>", "<Cmd>redo<CR>", mode = "n", desc = "Redo" },

	-- Others
	{ "<Esc>", "<Cmd>noh<CR>", mode = "n", desc = "Remove text highlight after searching", icon = { icon = "󰸱", color = "white" } },
	-- { "<leader>*", "<Cmd>noh<CR>", mode = { "n", "v" }, desc = "Remove text highlight after searching", icon = { icon = "󰸱", color = "white" } },
})
