-- lua/netrw.lua

if vim.fn.has("win32") == 1 then
  -- vim.opt.shellslash = true
  -- vim.g.netrw_localmovecmd = "cmd.exe"
  -- vim.g.netrw_localmovecmdopt = "/c move"
  vim.g.netrw_localmovecmd = vim.fn.expand("$COMSPEC")
  vim.g.netrw_localmovecmdopt = " /c move"

  vim.g.netrw_localcopycmd = vim.fn.expand("$COMSPEC")
  vim.g.netrw_localcopycmdopt = " /c copy"

end
-- Netrw должен получить эти глобальные настройки до первого открытия :Ex/:Explore.
-- Не отключай netrw через vim.g.loaded_netrw = 1,
-- иначе :Explore / :Lexplore перестанут работать.

-- Синхронизирует текущую директорию Neovim с каталогом netrw.
-- -- В статье это советуют для уменьшения ошибок при copy/move.
vim.g.netrw_keepdir = 0
--
-- -- Размер окна netrw при :Lexplore / :Vexplore, в процентах.
vim.g.netrw_winsize = 30
--
-- -- Убрать верхний баннер netrw.
-- Внутри netrw можно временно показать/скрыть его клавишей I.
vim.g.netrw_banner = 0
--
-- -- Список в виде дерева:
-- -- 0 = thin listing
-- -- 1 = long listing
-- -- 2 = wide listing
-- -- 3 = tree listing
vim.g.netrw_liststyle = 4

vim.g.netrw_chgwin = 1 -- Ensure that when closing Netrw, our cursor is always placed in the leftmost window
vim.g.netrw_clipboard = 0 -- Prevent Netrw from messing with the clipboard
vim.g.netrw_fastbrowse = 2 -- Fixes some weird behavior


--
-- Открывать файл справа от окна netrw.
vim.g.netrw_browse_split = 4

-- При вертикальном split размещать netrw слева.
vim.g.netrw_altv = 1

-- Показывать скрытые файлы только после gh или нашей клавиши "."
-- Это регулярное выражение скрывает dotfiles.
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

-- Подсветить отмеченные через mf файлы как результаты поиска.
vim.api.nvim_set_hl(0, "netrwMarkFile", { link = "Search" })

local group = vim.api.nvim_create_augroup("MyNetrwKeymaps", {
  clear = true,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "netrw",
  callback = function(event)
    local opts = {
      buffer = event.buf,
      remap = true,
      silent = true,
    }

    -- Навигация, близкая к файловым менеджерам.
    vim.keymap.set("n", "h", "-", opts)       -- Родительская папка
    vim.keymap.set("n", "l", "<CR>", opts)    -- Открыть файл / папку
    vim.keymap.set("n", "H", "u", opts)       -- Назад в истории каталогов

    -- Показ / скрытие dotfiles.
    vim.keymap.set("n", ".", "gh", opts)

    -- Закрыть preview-окно, открытое клавишей p.
    vim.keymap.set("n", "P", "<C-w>z", opts)

    -- Открыть выбранный файл и закрыть/переключить окно Lexplore.
    vim.keymap.set("n", "L", "<CR>:Lexplore<CR>", opts)

    -- Работа с отметками.
    vim.keymap.set("n", "<Tab>", "mf", opts)       -- Поставить/снять отметку
    vim.keymap.set("n", "<S-Tab>", "mF", opts)     -- Снять отметки в текущем окне
    vim.keymap.set("n", "<leader><Tab>", "mu", opts) -- Снять все отметки

    -- Операции с файлами.
    vim.keymap.set("n", "ff", "%:write<CR>:buffer #<CR>", opts)
    vim.keymap.set("n", "fe", "R", opts)           -- Rename / move одного файла

    -- Копирование отмеченных файлов.
    vim.keymap.set("n", "fc", "mc", opts)
    vim.keymap.set("n", "fC", "mtmc", opts)

    -- Перенос отмеченных файлов.
    -- На Windows netrw mm может ломаться, поэтому лучше использовать
    -- fe (R) для одного файла или PowerShell для нескольких.
    -- vim.keymap.set("n", "fx", "mm", opts)
    vim.keymap.set("n", "fX", "mtmm", opts)

    -- Внешняя команда для отмеченных файлов.
    vim.keymap.set("n", "f;", "mx", opts)

    -- Показать текущую папку назначения mt.
    vim.keymap.set("n", "fq", function()
      local ok, target = pcall(vim.fn["netrw#Expose"], "netrwmftgt")
      if ok and target and target ~= "" then
        vim.notify("Netrw target: " .. target, vim.log.levels.INFO)
      else
        vim.notify("Netrw target не установлен: наведи курсор на папку и нажми mt", vim.log.levels.WARN)
      end
    end, {
      buffer = event.buf,
      silent = true,
      desc = "Показать цель copy/move",
    })

    -- Явно назначить текущую папку целью копирования/перемещения.
    vim.keymap.set("n", "fd", "mt", opts)

    -- Закрыть/открыть боковое окно netrw.
    vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", opts)
  end,
})
