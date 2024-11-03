-- A blazing fast and easy to configure neovim statusline
return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local custom_iceberg_dark = require("lualine.themes.iceberg_dark")

    custom_iceberg_dark.normal.c.bg = "#0c0c0c"

    require("lualine").setup({
      options = {
        theme = custom_iceberg_dark,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function()
              return ""
            end,
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            newfile_status = false,
            path = 4,
          },
        },
        lualine_x = { "encoding", "filetype" },
      },
      inactive_sections = {
        lualine_x = { "" },
      },
    })
  end,
}
