-- lua/config/plugins.lua

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
  {
    src = "https://github.com/nvim-tree/nvim-web-devicons",
    name = "nvim-web-devicons",
  },
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
    src = "https://github.com/stevearc/oil.nvim",
    name = "oil.nvim",
  },
  {
    src = "https://github.com/mason-org/mason.nvim",
    name = "mason.nvim",
  },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
  },
  {
    src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    name = "render-markdown.nvim",
  },
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