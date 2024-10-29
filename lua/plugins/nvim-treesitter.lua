-- An incremental parsing system for programming tools
return {
  "nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
