-- lua/plugins/treesitter.lua

require("nvim-treesitter").setup({
  ensure_installed = {
  "markdown",
  "markdown_inline",
  "lua",
  "haskell",
  "java",
  "c",
  "cpp",
  "go",
  "matlab",
  },
  highlight = {
    enable = true,
  },
})
