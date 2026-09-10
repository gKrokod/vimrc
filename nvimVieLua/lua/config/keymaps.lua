-- lua/config/keymaps.lua

local map = vim.keymap.set

-- Отключение стрелок в normal-режиме
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")
map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")

-- Выход из insert-режима по kj
map("i", "kj", "<Esc>")
map("i", "KJ", "<Esc>")

-- Навигация по quickfix
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")

-- Открыть конфигурацию
map("n", "<leader>ev", ":edit $MYVIMRC<CR>", {
  desc = "Открыть init.lua",
})

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
  desc = "Найти файлы",
  silent = true,
})

map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {
  desc = "Поиск по тексту",
  silent = true,
})

map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {
  desc = "Буферы",
  silent = true,
})

-- Глобальные хоткеи для плагинов
-- Открыть файл через Oil по Ctrl+N
map("n", "<C-n>", "<cmd>Oil<CR>", {
  desc = "Файлы: открыть Oil",
  silent = true,
})
-- Markdown: переключить красивый вид
map("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", {
  desc = "Markdown: переключить красивый вид",
  silent = true,
})
