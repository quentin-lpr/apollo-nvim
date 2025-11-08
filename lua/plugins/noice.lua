-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      progress = {
        enabled = true,
      },
    },
    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
        },
        filter_opts = {
          cond = function(message)
            local client = vim.lsp.get_client_by_id(message.opts.client_id)
            return client and client.name == "jdtls"
          end,
        },
        opts = {
          skip = true,
        },
      },
    },
  },
}
