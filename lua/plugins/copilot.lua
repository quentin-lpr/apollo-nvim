-- Neovim plugin for GitHub Copilot
return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      -- vim.cmd("Copilot disable")
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    branch = "main",
    dependencies = {
      { "github/copilot.vim" },
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
      model = "claude-sonnet-4",
      question_header = "  User ",
      answer_header = "  Copilot ",
      error_header = "  Error ",
      auto_follow_cursor = false,
      insert_at_end = true,
      context = "buffers",
      highlight_selection = false,
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
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    opts = {
      provider = "copilot",
      auto_suggestions_provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4",
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      -- {
      --   "HakonHarnes/img-clip.nvim",
      --   event = "VeryLazy",
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
