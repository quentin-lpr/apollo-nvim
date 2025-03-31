vim.cmd("set autoread")
vim.cmd("set mouse=")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.cmd("set nu rnu")
vim.cmd("set splitbelow")
vim.cmd("set splitright")
vim.cmd("set nowrap")
vim.cmd("set laststatus=0")
vim.cmd.colorscheme("catppuccin-frappe")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "docker-compose.yml", "docker-compose.yaml" },
	callback = function()
		vim.bo.filetype = "yaml.docker-compose"
	end,
})
