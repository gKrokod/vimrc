-- init.lua

vim.g.mapleader = "\\"

require("config.options")
require("config.keymaps")
require("config.plugins")

-- Загрузка конфигов плагинов
require("plugins.oil")
require("plugins.treesitter")
require("plugins.markdown")
require("plugins.devicons")
require("plugins.lualine")
require("plugins.mason")

require("lsp")
