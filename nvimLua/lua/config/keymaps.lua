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
map("n", "<C-n>", "<cmd>Yazi<CR>", {
  desc = "Файлы: открыть Yazi",
  silent = true,
})
-- Yazi: открыть в текущей директории
map("n", "<leader>y", "<cmd>Yazi<CR>", {
  desc = "Файлы: открыть Yazi",
  silent = true,
})
-- Markdown: переключить красивый вид
map("n", "<leader>mr", "<cmd>RenderMarkdown toggle<CR>", {
  desc = "Markdown: переключить красивый вид",
  silent = true,
})

-- LSP: переключатель
map("n", "<C-\\>", function()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  local bufnr = vim.api.nvim_get_current_buf()
  
  if #buf_clients == 0 then
    -- LSP выключен, включаем
    local all_clients = vim.lsp.get_clients()
    for _, client in ipairs(all_clients) do
      vim.lsp.buf_attach_client(bufnr, client.id)
    end
    -- Сбрасываем состояние буфера
    vim.b.lsp_attached = nil
    vim.b.diagnostics_enabled = nil
    vim.notify("LSP: включён", vim.log.levels.INFO)
  else
    -- LSP включён, выключаем
    for _, client in ipairs(buf_clients) do
      vim.lsp.buf_detach_client(bufnr, client.id)
    end
    vim.b.lsp_attached = false
    vim.b.diagnostics_enabled = false
    vim.notify("LSP: выключен", vim.log.levels.INFO)
  end
end, {
  desc = "LSP: переключить",
  silent = true,
})
