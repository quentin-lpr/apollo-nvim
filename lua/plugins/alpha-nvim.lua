-- A lua powered greeter like vim-startify / dashboard-nvim
return {
  "goolord/alpha-nvim",
  dependencies = "echasnovski/mini.icons",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "          :::     :::::::::   ::::::::  :::        :::        ::::::::",
      "       :+: :+:   :+:    :+: :+:    :+: :+:        :+:       :+:    :+:",
      "     +:+   +:+  +:+    +:+ +:+    +:+ +:+        +:+       +:+    +:+ ",
      "   +#++:++#++: +#++:++#+  +#+    +:+ +#+        +#+       +#+    +:+  ",
      "  +#+     +#+ +#+        +#+    +#+ +#+        +#+       +#+    +#+   ",
      " #+#     #+# #+#        #+#    #+# #+#        #+#       #+#    #+#    ",
      "###     ### ###         ########  ########## ########## ########      ",
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "󰍉 Find file", ":Telescope find_files<CR>"),
      dashboard.button("n", "󰈙 New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("q", "󰈆 Quit", ":qa<CR>"),
    }

    dashboard.section.header.opts.hl = "DashboardHeader"
    dashboard.config.layout = {
      { type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }) },
      dashboard.section.header,
      { type = "padding", val = 10 },
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.opts)
  end,
}
