-- lua/lsp.lua

-- Глобальная активация LSP-серверов
vim.lsp.enable({
  "lua_ls",
  "hls",
})

-- Глобальная настройка диагностики
vim.diagnostic.config({ virtual_text = true })

-- Подключение конфигов конкретных серверов
require("lsp.hls")
require("lsp.lua_ls")