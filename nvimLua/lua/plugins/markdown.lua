-- lua/plugins/markdown.lua

-- require("render-markdown").setup({
--   file_types = {
--     "markdown",
--   },
--   heading = {
--     sign = false,
--     icons = {},
--   },
--
--   code = {
--     sign = false,
--     width = "block",
--     right_pad = 1,
--   },
--
--   checkbox = {
--     enabled = true,
--   },
-- })

-- Красивый Markdown внутри Neovim.
require("render-markdown").setup({
  file_types = { "markdown" },
  render_modes = { "n", "c", "t" },

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

  latex = {
    enabled = true,
    converter = { "utftex", "latex2text" },
    inline = true,
    block = true,
    position = "center",
  },
})

-- Точная HTML/KaTeX-предварительная визуализация.
require("livepreview.config").set({
  browser = "default",
  address = "127.0.0.1",
  port = 5500,
  dynamic_root = true,
  sync_scroll = true,
})

-- Быстрый ввод LaTeX в Markdown.
local ls = require("luasnip")
ls.config.setup({
  enable_autosnippets = true,
  history = true,
  update_events = "TextChanged,TextChangedI",
})

require("luasnip-latex-snippets").setup({
  use_treesitter = true,
  allow_on_markdown = true,
})

-- Переходы по полям snippet: Ctrl+L вперёд, Ctrl+H назад.
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "Snippet: expand/jump" })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "Snippet: jump back" })

-- Предпросмотр текущей заметки.
vim.keymap.set("n", "eader>mp", "md>LivePreview start<CR>", {
  silent = true,
  desc = "Markdown preview",
})

vim.keymap.set("n", "eader>mc", "md>LivePreview close<CR>", {
  silent = true,
  desc = "Markdown preview close",
})

vim.keymap.set("n", "eader>mr", "md>RenderMarkdown buf_toggle<CR>", {
  silent = true,
  desc = "Markdown render toggle",
})
