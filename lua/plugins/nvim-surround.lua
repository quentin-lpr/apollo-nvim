-- Add/change/delete surrounding delimiter pairs with ease
return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	version = "*",
	config = function()
		require("nvim-surround").setup()
	end,
}
