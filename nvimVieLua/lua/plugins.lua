vim.pack.add({
  {
    src = "https://github.com/NLKNguyen/papercolor-theme",
    name = "papercolor-theme",
  },
  {
    src = "https://github.com/raichoo/haskell-vim",
    name = "haskell-vim",
  },
  {
    src = "https://github.com/airblade/vim-rooter",
    name = "vim-rooter",
  },
  -- {
    -- src = "https://github.com/nvim-tree/nvim-tree.lua",
    -- name = "nvim-tree",
  -- },
  {
    src = "https://github.com/nvim-tree/nvim-web-devicons",
    name = "nvim-web-devicons",
  },
  -- {
    -- src = "https://github.com/tomtom/tcomment_vim",
    -- name = "tcomment_vim",
  -- },
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    name = "telescope.nvim",
  },
  {
    src = "https://github.com/nvim-lua/plenary.nvim",
    name = "plenary.nvim",
  },
  {
    src = "https://github.com/nvim-lualine/lualine.nvim",
    name = "lualine.nvim",
  },
  {
    src = "https://github.com/folke/which-key.nvim",
    name = "which-key.nvim",
  },
  { src = "https://github.com/mason-org/mason.nvim" },
})


-- PaperColor
vim.cmd.colorscheme("PaperColor")


-- vim-rooter
vim.g.rooter_patterns = {
  ".git",
  "Makefile",
  "CMakeLists.txt",
  "stack.yaml",
  "cabal.project",
}

-- NvimTree
-- require("nvim-tree").setup({
  -- view = {
    -- width = 35,
  -- },
  -- renderer = {
    -- group_empty = true,
    -- indent_markers = {
      -- enable = true,
    -- },
  -- },
  -- filters = {
    -- dotfiles = false,
  -- },
-- })

-- Lualine
require("lualine").setup({
  options = {
    theme = "PaperColor",
    component_separators = {
      left = "",
      right = "",
    },
    section_separators = {
      left = "",
      right = "",
    },
  },
})
-- Which-key
require("which-key").setup({})

require("mason").setup({})
