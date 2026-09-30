-- lua/lsp.lua
--
-- Подключение конфигов конкретных серверов
require("lsp.hls")
require("lsp.lua_ls")
-- require("lsp.clangd")
require("lsp.zls")

-- Глобальная активация LSP-серверов
vim.lsp.enable({
  "lua_ls",
  "hls",
  -- "clangd",
  "zls",
})

-- Глобальная настройка диагностики
-- vim.diagnostic.config({ virtual_text = true })

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  underline = true,
  signs = true,
})

-- Читаемый текст ошибки на тёмном фоне
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
  fg = "#ffcfaa",
  bg = "#3a2024",
})
