return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    -- Keymaps
    vim.keymap.set("n", "<C-o>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, desc = "" })
    vim.keymap.set("n", "<C-i>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, desc = "" })
    -- vim.keymap.set('', '', '', { noremap = true, desc = '' })

    require("bufferline").setup({
      options = {
        show_tab_indicators = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = false,
            text_align = "center",
          },
        },
        show_close_icon = false,
        show_buffer_close_icons = true,
        separator_style = "slope",
      },
    })

    -- Ajout de l'autocommand pour masquer la bufferline sur l'écran alpha
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.showtabline = 0
      end,
    })

    -- Restaurer la bufferline lorsqu'on quitte l'écran alpha
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.showtabline = 2
      end,
    })
  end,
}
