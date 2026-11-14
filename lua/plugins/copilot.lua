-- Neovim plugin for GitHub Copilot
return {
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    dependencies = "copilotlsp-nvim/copilot-lsp",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 50,
        trigger_on_accept = true,
        keymap = {
          accept = "<M-l>",
          accept_word = "<M-Right>",
          accept_line = false,
          next = "<M-j>",
          prev = "<M-k>",
          dismiss = false,
        },
      },
      -- nes = {
      --   enabled = true,
      --   auto_trigger = false,
      --   keymap = {
      --     accept_and_goto = false,
      --     accept = "<Tab>",
      --     dismiss = "<ESC>",
      --   },
      -- },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken",
    opts = {
      debug = false,
      window = {
        layout = "float",
        width = 0.9,
        height = 0.9,
        border = "rounded",
        title = "Copilot Chat",
      },
      mappings = {
        close = {
          normal = "<Esc>",
        },
      },
      model = "gpt-4.1",
      question_header = "  User ",
      answer_header = "  Copilot ",
      error_header = "  Error ",
      auto_follow_cursor = false,
      insert_at_end = true,
      context = "buffers",
      highlight_selection = false,
      sticky = {
        "#buffer:listed",
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      chat.setup(opts)

      local wk = require("which-key")
      wk.add({
        {
          group = "Copilot",
          "<leader>c",
          { "<leader>cc", chat.toggle, mode = { "n", "v" }, desc = "Toggle Copilot Chat", icon = { icon = "󰭹", color = "white" } },
          { "<leader>ca", "<Cmd>CopilotChatAgents<CR>", mode = { "n", "v" }, desc = "Select agent", icon = { icon = "󰵰", color = "white" } },
          { "<leader>cm", "<Cmd>CopilotChatModels<CR>", mode = { "n", "v" }, desc = "Select model", icon = { icon = " ", color = "white" } },
          { "<leader>cp", "<Cmd>CopilotChatPrompts<CR>", mode = { "n", "v" }, desc = "Copilot prompts", icon = { icon = "󰭻", color = "white" } },
          icon = { icon = " ", color = "white" },
        },
      })
    end,
  }
}
