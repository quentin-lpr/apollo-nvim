-- An eye friendly plugin that fades your inactive buffers and preserves your syntax highlighting
return {
  "TaDaa/vimade",
  event = "VeryLazy",
  opts = {
    fadelevel = 0.5,
  }
}
