-- init.lua
-- init.lua
if vim.loader then
  vim.loader.enable()
end

-- Отключаем встроенные плагины до загрузки чего-либо (экономит ~3-5 мс)
local disabled_built_ins = {
  "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
  "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
  "2html_plugin", "logipat", "rrhelper", "spellfile_plugin",
  "matchit", "tutor", "rplugin", "netrw", "netrwPlugin",
  "netrwSettings", "netrwFileHandlers",
}
for _, plugin in ipairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
vim.g.loaded_remote_plugins = 1 -- отключает rplugin.vim (0.72 мс в вашем логе)

vim.g.mapleader = "\\"
vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

-- Зарезервируем место под статус-строку сразу, чтобы экран не прыгал при загрузке lualine
vim.opt.laststatus = 2

require("config.options")
require("config.keymaps")
local plugins = require("config.plugins")

-- Загружаем остальные плагины сразу ПОСЛЕ того, как окно Neovim появилось на экране
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.schedule(function()
      vim.opt.clipboard = "unnamedplus" -- инициализируем буфер обмена ПОСЛЕ отрисовки окна
      plugins.load_deferred()

      require("plugins.lualine")
      require("plugins.treesitter")
      require("plugins.markdown")
      require("plugins.autopairs")
      require("plugins.yazi")
      require("lsp")
-- Если Neovim был запущен сразу с файлом, применяем к нему свежезагруженные плагины и LSP
      if vim.api.nvim_buf_get_name(0) ~= "" then
        vim.cmd("filetype detect")
        vim.cmd("doautocmd BufReadPost")
      end
      -- Mason грузим последним
      vim.defer_fn(function()
        require("plugins.mason")
      end, 50)
    end)
  end,
})

-- -- init.lua (добавить в самый верх файла)
-- if vim.loader then
--   vim.loader.enable() -- Кэширует Lua-модули в байткод (ускоряет старт в 2-3 раза на Windows)
-- end
--
-- -- Отключаем стандартные плагины, которые не нужны (особенно netrw, т.к. есть Yazi)
-- local disabled_built_ins = {
--   "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
--   "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
--   "getscript", "getscriptPlugin", "vimball", "vimballPlugin",
--   "2html_plugin", "logipat", "rrhelper", "spellfile_plugin", "matchit", "tutor"
-- }
-- for _, plugin in pairs(disabled_built_ins) do
--   vim.g["loaded_" .. plugin] = 1
-- end
--
-- -- Отключаем поиск внешних провайдеров (на Windows поиск python/node в PATH сильно фризит)
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_perl_provider = 0
-- vim.g.loaded_node_provider = 0
--
--
--
--
-- vim.g.mapleader = "\\"
--
--
-- vim.g.zig_fmt_parse_errors = 0
-- vim.g.zig_fmt_autosave = 0
--
-- -- require("config.options")
-- -- require("config.keymaps")
-- -- require("config.plugins")
-- -- require("plugins.lualine")
-- --
-- -- -- Загрузка конфигов плагинов
-- -- require("plugins.treesitter")
-- -- require("plugins.markdown")
-- -- -- require("plugins.devicons")
-- -- require("plugins.mason")
-- -- -- require("plugins.snacks")
-- -- require("plugins.autopairs")
-- -- require("plugins.yazi")
-- -- require("lsp")
-- --
-- -- Загрузка базовых настроек и темы (выполняется сразу)
-- require("config.options")
-- require("config.keymaps")
-- require("config.plugins")
-- require("plugins.lualine")
--
-- -- Откладываем тяжелые плагины на момент ПОСЛЕ отрисовки интерфейса (через 10-20 мс после старта)
-- vim.api.nvim_create_autocmd("UIEnter", {
--   once = true,
--   callback = function()
--     require("plugins.treesitter")
--     require("plugins.autopairs")
--     require("plugins.yazi")
--     require("lsp")
--     --
--     -- Mason нужен только для установки серверов, грузим его в фоне последним
--     vim.defer_fn(function()
--       require("plugins.mason")
--     end, 100)
--   end,
-- })
--
-- -- Грузим render-markdown только при открытии markdown-файлов
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown" },
--   once = true,
--   callback = function()
--     require("plugins.markdown")
--   end,
-- })
