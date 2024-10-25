-- An eye friendly plugin that fades your inactive buffers and preserves your syntax highlighting
return {
  "TaDaa/vimade",
  event = "VeryLazy",
  config = function()
    vim.g.vimade = {
      fadelevel = 0.6,
    }
  end,
}
