-- от рендера форму
-- vim.opt.conceallevel = 2
-- vim.opt.concealcursor = "nc"

vim.opt.tabstop = 2

vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.listchars = {
  tab = "→ ",
  eol = "↲",
}
vim.opt.list = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.signcolumn = "yes"
-- явно указание на win32yank, чтобы не искать утилиту буфера обмена по всему PATH
vim.g.clipboard = {
  name = "win32yank",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
  cache_enabled = 1,
}
-- vim.opt.clipboard = "unnamedplus" - init.lua

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.modeline = false

-- vim.opt.path:append("**")
vim.opt.wildmenu = true

-- Тема PaperColor
vim.opt.background = "dark"

-- Оптимизированный поиск корня проекта в options.lua
local root_markers = { ".git", "Makefile", "CMakeLists.txt", "stack.yaml", "cabal.project" }
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(ctx)
    -- Пропускаем терминалы, плавающие окна, Yazi, Telescope и пустые буферы
    if vim.bo[ctx.buf].buftype ~= "" then return end

    local root = vim.b[ctx.buf].root_dir
    if root == nil then
      root = vim.fs.root(ctx.buf, root_markers) or false
      vim.b[ctx.buf].root_dir = root
    end
    if root and root ~= vim.fn.getcwd() then
      vim.fn.chdir(root)
    end
  end,
})

vim.opt.shada = "!,'50,<50,s10,h"
-- =========================================================
-- Настройка сворачивания кода (Folding) и его сохранения
-- =========================================================
vim.opt.foldmethod = "manual" -- Ручной режим (позволяет создавать фолды через zf)
vim.opt.foldenable = true     -- Включить фолдинг по умолчанию

-- Сохраняем во view-файл ТОЛЬКО фолды и позицию курсора
-- (чтобы не перезаписывать рабочую директорию и настройки плагинов)
vim.opt.viewoptions = { "folds", "cursor" }

local save_fold_group = vim.api.nvim_create_augroup("PersistentFolds", { clear = true })

-- Сохраняем фолды при закрытии буфера/выходе из Neovim
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = save_fold_group,
  pattern = "*",
  callback = function(ctx)
    -- Игнорируем терминалы, Yazi, Telescope и пустые безымянные буферы
    if vim.bo[ctx.buf].buftype == "" and vim.api.nvim_buf_get_name(ctx.buf) ~= "" then
      vim.cmd("silent! mkview")
    end
  end,
})

-- Восстанавливаем фолды (и строчку, где стоял курсор) при открытии файла
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = save_fold_group,
  pattern = "*",
  callback = function(ctx)
    if vim.bo[ctx.buf].buftype == "" and vim.api.nvim_buf_get_name(ctx.buf) ~= "" then
      vim.cmd("silent! loadview")
    end
  end,
})
