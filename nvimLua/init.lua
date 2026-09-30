-- init.lua

vim.g.mapleader = "\\"

vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0
--
require("config.options")
require("config.keymaps")
require("config.plugins")

-- Загрузка конфигов плагинов
require("plugins.treesitter")
require("plugins.markdown")
-- require("plugins.devicons")
require("plugins.lualine")
require("plugins.mason")
-- require("plugins.snacks")
require("plugins.yazi")

require("lsp")
