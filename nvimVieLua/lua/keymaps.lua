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
-- Netrw
map("n", "<C-n>", "<cmd>Lexplore<CR>", {
  desc = "Файловый менеджер Netrw",
})
map("n", "<leader>ed", "<cmd>Lexplore %:p:h<CR>", {
  desc = "Netrw: папка текущего файла",
})
-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
  desc = "Найти файлы",
})

map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {
  desc = "Поиск по тексту",
})

map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", {
  desc = "Буферы",
})

-- TComment
-- map({ "n", "x" }, "<leader>c", "<cmd>TComment<CR>", {
  -- desc = "Закомментировать строку/блок",
-- })


