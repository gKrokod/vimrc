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
-- Открыть конфигурацию alacritty
map("n", "<leader>ea", ":edit C:/Users/User/AppData/Roaming/alacritty/alacritty.toml<CR>", {
  desc = "Открыть alacritty.toml",
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

map("n", "<leader>mp", "<cmd>LivePreview start<CR>", {
  desc = "Markdown: открыть preview",
  silent = true,
})

map("n", "<leader>mc", "<cmd>LivePreview close<CR>", {
  desc = "Markdown: закрыть preview",
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

-- Выход из терминала в Normal mode по F12
map('t', '<F12>', '<C-\\><C-n>', { desc = 'terminal: exit to Normal mode' })

-- Переключение между окнами по Alt+hjkl из ЛЮБОГО режима (Normal, Insert, Visual, Terminal) за одно нажатие
local nav_modes = { 'n', 'i', 'v', 't' }

map(nav_modes, '<A-h>', '<C-\\><C-n><C-w>h', { desc = 'Go to left window' })
map(nav_modes, '<A-j>', '<C-\\><C-n><C-w>j', { desc = 'Go to lower window' })
map(nav_modes, '<A-k>', '<C-\\><C-n><C-w>k', { desc = 'Go to upper window' })
map(nav_modes, '<A-l>', '<C-\\><C-n><C-w>l', { desc = 'Go to right window' })


-- -- Auto insert mode in terminal: entering terminal window -> insert, leaving -> normal
vim.api.nvim_create_autocmd('WinEnter', {
  callback = function()
    if vim.bo.buftype == 'terminal' then
      vim.cmd('startinsert')
    end
  end,
})
vim.api.nvim_create_autocmd('WinLeave', {
  callback = function()
    if vim.bo.buftype == 'terminal' then
      vim.cmd('stopinsert')
    end
  end,
})
-- lua/config/keymaps.lua
local term_buf = nil
local prev_buf = nil

-- sync_dir = false -> просто показать/скрыть консоль (Ctrl + Space)
-- sync_dir = true  -> показать консоль и перейти в папку файла (Ctrl + K или Ctrl + /)
local function toggle_fullscreen_terminal(sync_dir)
  -- 1. Если мы уже в консоли — любое из сочетаний прячет её и возвращает к файлу
  if vim.bo.buftype == "terminal" then
    vim.cmd("stopinsert")
    if prev_buf and vim.api.nvim_buf_is_valid(prev_buf) then
      vim.api.nvim_set_current_buf(prev_buf)
    else
      vim.cmd("bprevious")
    end
    return
  end

  -- Если нажали хоткей во время набора текста в режиме Insert — выходим из него
  if vim.fn.mode() == "i" then
    vim.cmd("stopinsert")
  end

  -- Запоминаем текущий буфер с кодом и папку этого файла
  prev_buf = vim.api.nvim_get_current_buf()
  local current_file = vim.api.nvim_buf_get_name(prev_buf)
  local file_dir = (current_file ~= "") and vim.fs.dirname(current_file) or vim.fn.getcwd()

  -- 2. Если консоль уже запущена в фоне — переключаемся на неё
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.api.nvim_set_current_buf(term_buf)

    -- Если нажали Ctrl+K (или Ctrl+/), меняем папку внутри консоли на папку текущего файла
    if sync_dir and file_dir ~= "" then
      local chan = vim.bo[term_buf].channel
      if chan and chan > 0 then
        vim.api.nvim_chan_send(chan, 'Set-Location -LiteralPath "' .. file_dir .. '"\r')
      end
    end

    vim.cmd("startinsert")
  else
    -- 3. Если консоли еще нет — создаем её
    if sync_dir and file_dir ~= "" then
      vim.fn.chdir(file_dir)
    end

    vim.cmd("term pwsh -NoLogo -NoProfile")
    term_buf = vim.api.nvim_get_current_buf()
    vim.bo[term_buf].buflisted = false

    -- Если внутри PowerShell ввести "exit", удаляем буфер и возвращаемся к коду
    vim.api.nvim_create_autocmd("TermClose", {
      buffer = term_buf,
      once = true,
      callback = function()
        local closed_buf = term_buf
        term_buf = nil
        vim.schedule(function()
          if prev_buf and vim.api.nvim_buf_is_valid(prev_buf) then
            vim.api.nvim_set_current_buf(prev_buf)
          end
          if closed_buf and vim.api.nvim_buf_is_valid(closed_buf) then
            vim.api.nvim_buf_delete(closed_buf, { force = true })
          end
        end)
      end,
    })

    vim.cmd("startinsert")
  end
end

-- 1. Ctrl + Space: просто переключить консоль (сохраняя её текущую папку)
map({ "n", "i", "t" }, "<C-space>", function()
  toggle_fullscreen_terminal(false)
end, {
  desc = "Терминал: просто переключить",
  silent = true,
})

-- 2. Ctrl + K (под правой рукой): открыть консоль в папке текущего файла / свернуть обратно
map({ "n", "i", "t" }, "<C-k>", function()
  toggle_fullscreen_terminal(true)
end, {
  desc = "Терминал: открыть в папке текущего файла",
  silent = true,
})

-- Дубль на Ctrl + / (клавиша со слэшем возле правого Shift)
map({ "n", "i", "t" }, "<C-/>", function()
  toggle_fullscreen_terminal(true)
end, {
  desc = "Терминал: открыть в папке текущего файла",
  silent = true,
})
