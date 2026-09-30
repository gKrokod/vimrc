-- lua/plugins/treesitter.lua
--
-- require("nvim-treesitter").setup({
--   ensure_installed = {
--   "markdown",
--   "markdown_inline",
--   "lua",
--   "haskell",
--   "java",
--   "c",
--   "cpp",
--   "go",
--   "matlab",
--   },
--   highlight = {
--     enable = true,
--   },
-- })
--
require("nvim-treesitter").compilers = {
  "zig",
}

require("nvim-treesitter").setup({
  ensure_installed = {
    "c",
    "cpp",
    "go",
    "haskell",
    "java",
    "lua",
    "markdown",
    "markdown_inline",
    "matlab",
    "zig",
  },

  highlight = {
    enable = true,
  },
})
