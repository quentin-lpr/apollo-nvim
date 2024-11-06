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

	-- Copy/Paste inside '*' register
	{ "<C-c>", '"*y', mode = "v", desc = "Copy to clipboard", icon = { icon = "", color = "white" } },
	{ "<C-v>", '<Esc>"*p', mode = { "n", "i" }, desc = "Paste from clipboard", icon = { icon = "", color = "white" } },

	-- Buffer handling
	{ "<C-n>", "<Cmd>enew<CR><Esc>", mode = { "n", "i" }, desc = "Create a new empty buffer", icon = { icon = "󱧕", color = "white" } },
	{ "<C-x>", "<Cmd>bdelete<CR><Esc>", mode = { "n", "i" }, desc = "Delete current buffer", icon = { icon = "󱧖", color = "white" } },
	{ "<C-h>", "<C-\\><C-n><C-W>h", mode = { "n", "t" }, desc = "Move to left window", icon = { icon = "", color = "white" } },
	{ "<C-j>", "<C-\\><C-n><C-W>j", mode = { "n", "t" }, desc = "Move to bottom window", icon = { icon = "", color = "white" } },
	{ "<C-k>", "<C-\\><C-n><C-W>k", mode = { "n", "t" }, desc = "Move to top window", icon = { icon = "", color = "white" } },
	{ "<C-l>", "<C-\\><C-n><C-W>l", mode = { "n", "t" }, desc = "Move to right window", icon = { icon = "", color = "white" } },
	{ "<C-S-Up>", "<Cmd>m -2<CR>", mode = "n", desc = "Move line up", icon = { icon = "", color = "white" } },
	{ "<C-S-Up>", ":m '<-2<CR>gv=gv", mode = "v", desc = "Move selection up", icon = { icon = "", color = "white" } },
	{ "<C-S-Down>", "<Cmd>m +1<CR>", mode = "n", desc = "Move line down", icon = { icon = "", color = "white" } },
	{ "<C-S-Down>", ":m '>+1<CR>gv=gv", mode = "v", desc = "Move selection down", icon = { icon = "", color = "white" } },
	{
		group = "Buffer",
		"<leader>b",
		{ "<leader>bf", vim.lsp.buf.format, mode = "n", desc = "Format buffer", icon = { icon = "󰉼", color = "white" } },
		icon = { icon = "󰈔", color = "white" },
	},
	-- { "<M-CR>", "<Esc>gg=G", mode = { "n", "i" }, desc = "Reindent entire file", icon = { icon = "󰉼", color = "white" } },

	-- Code
	{ "u", "<Cmd>undo<CR>", mode = "n", desc = "Undo", icon = { icon = "󰕌", color = "white" } },
	{ "<C-r>", "<Cmd>redo<CR>", mode = "n", desc = "Redo", icon = { icon = "󰑎", color = "white" } },

	-- Others
	{ "<Esc>", "<Cmd>noh<CR>", mode = "n", desc = "Remove text highlight after searching", icon = { icon = "󰸱", color = "white" } },
})
