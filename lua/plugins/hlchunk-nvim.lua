return {
  "shellRaining/hlchunk.nvim",
  event = "VeryLazy",
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        priority = 15,
        style = {
          { fg = "#3c3c3c" },
          { fg = "#883c3c" },
        },
        use_treesitter = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "─",
        },
        textobject = "",
        error_sign = true,
        duration = 200,
        delay = 100,
      },
      line_num = {
        enable = true,
        style = "#3f3f3f",
        priority = 10,
      },
    })
  end,
}
