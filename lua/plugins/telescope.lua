-- Find, Filter, Preview, Pick. All lua, all the time
return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    tag = "0.1.8",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local function multiopen(prompt_bufnr)
        local picker = action_state.get_current_picker(prompt_bufnr)
        local multi = picker:get_multi_selection()

        if not vim.tbl_isempty(multi) then
          actions.close(prompt_bufnr)
          for _, j in pairs(multi) do
            if j.path ~= nil then
              local path = vim.fn.fnameescape(j.path)
              if j.lnum ~= nil then
                vim.cmd(string.format("silent! edit +%d %s", j.lnum, path))
              else
                vim.cmd(string.format("silent! edit %s", path))
              end
            end
          end
        else
          actions.select_default(prompt_bufnr)
        end
      end

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            ".git",
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--glob=!package-lock.json",
          },
          mappings = {
            i = {
              ["<CR>"] = multiopen,
            },
            n = {
              ["<CR>"] = multiopen,
            },
          },
        },
        pickers = {
          help_tags = {
            mappings = {
              i = {
                ["<CR>"] = "file_vsplit",
              },
              n = {
                ["<CR>"] = "file_vsplit",
              },
            },
          },
        },
      })

      -- Keymaps
      local telescope = require("telescope.builtin")
      local wk = require("which-key")
      wk.add({
        {
          group = "Telescope",
          "<leader>f",
          { "<leader>ff", telescope.find_files, mode = "n", desc = "Find files", icon = { icon = "", color = "white" } },
          { "<leader>fg", telescope.live_grep, mode = "n", desc = "Grep", icon = { icon = "󰍇", color = "white" } },
          { "<leader>fs", telescope.grep_string, mode = "n", desc = "Grep string", icon = { icon = "󰍇", color = "white" } },
          { "<leader>fb", telescope.buffers, mode = "n", desc = "Buffers", icon = { icon = "", color = "white" } },
          { "<leader>fh", telescope.help_tags, mode = "n", desc = "Help", icon = { icon = "󰋖", color = "white" } },
          { "<leader>fd", telescope.diagnostics, mode = "n", desc = "Diagnostics", icon = { icon = "", color = "white" } },
          { "<leader>ft", telescope.filetypes, mode = "n", desc = "File Types", icon = { icon = "", color = "white" } },
          { "<leader>fn", "<Cmd>Telescope notify<CR>", mode = "n", desc = "Notifications", icon = { icon = "󰎟", color = "white" } },
          icon = { icon = "", color = "white" },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
  },
}
