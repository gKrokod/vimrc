-- lua/config/plugins.lua

-- lua/config/plugins.lua

-- 1. Грузим ТОЛЬКО тему при старте, чтобы окно отрисовалось мгновенно
vim.pack.add({
  {
    src = "https://github.com/NLKNguyen/papercolor-theme",
    name = "papercolor-theme",
  },
})

vim.cmd.colorscheme("PaperColor")

-- 2. Функция для фоновой подгрузки остальных плагинов (вызывается из init.lua после старта UI)
local plugins_loaded = false
return {
  load_deferred = function()
    if plugins_loaded then return end
    plugins_loaded = true

    vim.pack.add({
      {
        src = "https://github.com/nvim-lualine/lualine.nvim",
        name = "lualine.nvim",
      },
      {
        src = "https://github.com/nvim-tree/nvim-web-devicons",
        name = "nvim-web-devicons",
      },
      {
        src = "https://github.com/windwp/nvim-autopairs",
        name = "nvim-autopairs",
      },
      {
        src = "https://github.com/mikavilpas/yazi.nvim",
        name = "yazi.nvim",
      },
      {
        src = "https://github.com/nvim-lua/plenary.nvim",
        name = "plenary.nvim",
      },
      {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        name = "telescope.nvim",
      },
      {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        name = "nvim-treesitter",
      },
      {
        src = "https://github.com/mason-org/mason.nvim",
        name = "mason.nvim",
      },
      {
        src = "https://codeberg.org/ziglang/zig.vim",
        name = "ziglang",
      },
      {
        src = "https://github.com/raichoo/haskell-vim",
        name = "haskell-vim",
      },
      {
        src = "https://github.com/L3MON4D3/LuaSnip",
        name = "LuaSnip",
        version = "v2.5.0",
      },
      {
        src = "https://github.com/iurimateus/luasnip-latex-snippets.nvim",
        name = "luasnip-latex-snippets.nvim",
      },
      {
        src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
        name = "render-markdown.nvim",
      },
      {
        src = "https://github.com/brianhuster/live-preview.nvim",
        name = "live-preview.nvim",
      },
    })
  end,
}

-- vim.pack.add({
--   {
--     src = "https://github.com/brianhuster/live-preview.nvim",
--     name = "live-preview.nvim",
--   },
--   {
--     src = "https://github.com/windwp/nvim-autopairs",
--     name = "nvim-autopairs",
--   },
--   {
--     src = "https://github.com/L3MON4D3/LuaSnip",
--     name = "LuaSnip",
--     version = "v2.5.0",
--   },
--   {
--     src = "https://github.com/iurimateus/luasnip-latex-snippets.nvim",
--     name = "luasnip-latex-snippets.nvim",
--   },
--   -- {
--   --   src = "https://github.com/techwizrd/render-latex.nvim",
--   --   name = "render-latex",
--   -- },
--   {
--     src = "https://codeberg.org/ziglang/zig.vim",
--     name = "ziglang",
--   },
--   {
--     src = "https://github.com/NLKNguyen/papercolor-theme",
--     name = "papercolor-theme",
--   },
--   {
--   src = "https://github.com/mikavilpas/yazi.nvim",
--   name = "yazi.nvim",
--   },
--   {
--     src = "https://github.com/raichoo/haskell-vim",
--     name = "haskell-vim",
--   },
--   -- {
--   --   src = "https://github.com/airblade/vim-rooter",
--   --   name = "vim-rooter",
--   -- },
--   {
--     src = "https://github.com/nvim-tree/nvim-web-devicons",
--     name = "nvim-web-devicons",
--   },
--   {
--     src = "https://github.com/nvim-telescope/telescope.nvim",
--     name = "telescope.nvim",
--   },
--   {
--     src = "https://github.com/nvim-lua/plenary.nvim",
--     name = "plenary.nvim",
--   },
--   {
--     src = "https://github.com/nvim-lualine/lualine.nvim",
--     name = "lualine.nvim",
--   },
--   {
--     src = "https://github.com/mason-org/mason.nvim",
--     name = "mason.nvim",
--   },
--   {
--     src = "https://github.com/nvim-treesitter/nvim-treesitter",
--     name = "nvim-treesitter",
--   },
--   {
--     src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
--     name = "render-markdown.nvim",
--   },
-- })
--
-- -- PaperColor
-- vim.cmd.colorscheme("PaperColor")
--
-- -- vim-rooter
-- -- vim.g.rooter_patterns = {
-- --   ".git",
-- --   "Makefile",
-- --   "CMakeLists.txt",
-- --   "stack.yaml",
-- --   "cabal.project",
-- -- }
