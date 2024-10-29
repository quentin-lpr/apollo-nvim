-- A fancy, configurable, notification manager
return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    vim.notify = require("notify").setup({
      fps = 60,
      level = 2,
      minimum_width = 30,
      max_width = 50,
      render = "wrapped-compact",
      stages = "static",
      timeout = 1500,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "",
      },
    })
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd([[
          highlight NotifyERRORBorder guifg=#8A1F1F
          highlight NotifyERRORIcon guifg=#F70067
          highlight NotifyERRORTitle  guifg=#F70067
          highlight NotifyWARNBorder guifg=#79491D
          highlight NotifyWARNIcon guifg=#F79000
          highlight NotifyWARNTitle guifg=#F79000
          highlight NotifyINFOBorder guifg=#808080
          highlight NotifyINFOIcon guifg=#808080
          highlight NotifyINFOTitle guifg=#808080
          highlight NotifyDEBUGBorder guifg=#8B8B8B
          highlight NotifyDEBUGIcon guifg=#8B8B8B
          highlight NotifyDEBUGTitle  guifg=#8B8B8B
          highlight NotifyTRACEBorder guifg=#4F3552
          highlight NotifyTRACEIcon guifg=#D484FF
          highlight NotifyTRACETitle  guifg=#D484FF
        ]])
      end,
    })
  end,
}
