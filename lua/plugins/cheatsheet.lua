return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("cheatsheet").setup({
      bundled_cheatsheets = false,
      bundled_plugin_cheatsheets = false,
      include_only_installed_plugins = true,
      telescope_mappings = {
        ["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
        ["<M-CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
        ["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
        ["<C-E>"] = require("cheatsheet.telescope.actions").edit_user_cheatsheet,
      },
    })
  end,
}
