-- lua/plugins/markdown.lua

require("render-markdown").setup({
  file_types = {
    "markdown",
  },

  heading = {
    sign = false,
    icons = {},
  },

  code = {
    sign = false,
    width = "block",
    right_pad = 1,
  },

  checkbox = {
    enabled = true,
  },
})