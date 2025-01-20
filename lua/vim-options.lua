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

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
	end,
})
