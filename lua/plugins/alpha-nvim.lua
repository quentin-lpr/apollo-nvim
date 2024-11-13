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
      dashboard.button("ff", "󰍉  Find file", "<Cmd>Telescope find_files<CR>"),
      dashboard.button("fg", "  Grep", "<Cmd>Telescope live_grep<CR>"),
      dashboard.button("q", "󰈆  Quit", "<Cmd>qa<CR>"),
    }

    dashboard.section.header.opts.hl = "AlphaHeader"

    dashboard.config.layout = {
      { type = "padding", val = vim.fn.floor(vim.fn.winheight(0) / 3) },
      dashboard.section.header,
      { type = "padding", val = vim.fn.floor(vim.fn.winheight(0) / 8) },
      dashboard.section.buttons,
    }

    alpha.setup(dashboard.opts)
  end,
}
