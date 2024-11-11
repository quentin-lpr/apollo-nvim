return {
  "booperlv/nvim-gomove",
  event = "VeryLazy",
  config = function()
    require("gomove").setup({
      map_defaults = false,
    })

    -- [TODO] Add icons
    local wk = require("which-key")
    local normal_mappings = {
      { "<M-h>", "<Plug>GoNSMLeft", mode = "n", desc = "Move selection left", icon = { icon = "", color = "white" } },
      { "<M-j>", "<Plug>GoNSMDown", mode = "n", desc = "Move selection down", icon = { icon = "", color = "white" } },
      { "<M-k>", "<Plug>GoNSMUp", mode = "n", desc = "Move selection up", icon = { icon = "", color = "white" } },
      { "<M-l>", "<Plug>GoNSMRight", mode = "n", desc = "Move selection right", icon = { icon = "", color = "white" } },
      { "<M-S-h>", "<Plug>GoNSDLeft", mode = "n", desc = "Duplicate selection left", icon = { icon = "", color = "white" } },
      { "<M-S-j>", "<Plug>GoNSDDown", mode = "n", desc = "Duplicate selection down", icon = { icon = "", color = "white" } },
      { "<M-S-k>", "<Plug>GoNSDUp", mode = "n", desc = "Duplicate selection up", icon = { icon = "", color = "white" } },
      { "<M-S-l>", "<Plug>GoNSDRight", mode = "n", desc = "Duplicate selection right", icon = { icon = "", color = "white" } },
    }
    local visual_mappings = {
      { "<M-h>", "<Plug>GoVSMLeft", mode = "v", desc = "Move selection left", icon = { icon = "", color = "white" } },
      { "<M-j>", "<Plug>GoVSMDown", mode = "v", desc = "Move selection down", icon = { icon = "", color = "white" } },
      { "<M-k>", "<Plug>GoVSMUp", mode = "v", desc = "Move selection up", icon = { icon = "", color = "white" } },
      { "<M-l>", "<Plug>GoVSMRight", mode = "v", desc = "Move selection right", icon = { icon = "", color = "white" } },
      { "<M-S-h>", "<Plug>GoVSDLeft", mode = "v", desc = "Duplicate selection left", icon = { icon = "", color = "white" } },
      { "<M-S-j>", "<Plug>GoVSDDown", mode = "v", desc = "Duplicate selection down", icon = { icon = "", color = "white" } },
      { "<M-S-k>", "<Plug>GoVSDUp", mode = "v", desc = "Duplicate selection up", icon = { icon = "", color = "white" } },
      { "<M-S-l>", "<Plug>GoVSDRight", mode = "v", desc = "Duplicate selection right", icon = { icon = "", color = "white" } },
    }
    wk.add(normal_mappings)
    wk.add(visual_mappings)
  end,
}
