return {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    -- "stevearc/oil.nvim", -- (optional) to manage project files
  },
  config = function()
    require("xcodebuild").setup({
    })
  end,
}
