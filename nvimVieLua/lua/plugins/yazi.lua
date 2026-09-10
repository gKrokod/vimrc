-- lua/plugins/yazi.lua

-- lua/plugins/yazi.lua

require("yazi").setup({
  -- === Основные настройки ===
  -- Открывать Yazi при редактировании директории (например, `nvim .` или `:e src/`)
  -- true = Yazi заменит встроенный file explorer
  -- false = нужно явно вызывать :Yazi
  open_for_directories = true,
  
  -- Открывать Yazi при запуске Neovim без файлов
  open_for_default = false,
  
  -- === Интеграции ===
  
  integrations = {
    -- Поиск в директории через Telescope после выбора в Yazi
    grep_in_directory = true,
    
    -- Поиск в выбранных файлах после выбора в Yazi
    grep_in_selected_files = true,
  },
  
  -- === Настройки floating окна ===
  
  floating = {
    -- Ширина окна (0.8 = 80% экрана, 0 = полная ширина)
    width = 0.8,
    
    -- Высота окна (0.8 = 80% экрана, 0 = полная высота)
    height = 0.8,
    
    -- Отступы от краёв экрана
    padding = 2,
    
    -- Тип границы: "rounded", "single", "double", "none"
    border = "rounded",
    
    -- Позиция: "center", "top", "bottom", "left", "right"
    position = "center",
    
    -- Настройки окна Neovim
    win_options = {
      winblend = 0,  -- Прозрачность (0-100)
    },
  },
  
  -- === Настройки процесса Yazi ===
  
  -- Дополнительные аргументы для Yazi
  yazi_args = {},
  
  -- Переменные окружения для процесса Yazi
  yazi_env = {},
  
  -- === Настройки буфера ===
  
  -- Буферные опции для Yazi
  buf_options = {
    buflisted = false,  -- Не показывать в :ls
    bufhidden = "hide", -- Скрывать буфер при переключении
  },
  
  -- === Настройки окна ===
  
  win_options = {
    wrap = false,       -- Не переносить строки
    signcolumn = "no",  -- Не показывать sign column
    cursorcolumn = false,
    foldcolumn = "0",
    spell = false,
    list = false,
  },
  
  -- === Хоткеи внутри Yazi ===
  
  -- keymaps = {
  --   -- Открыть файл
  --   ["<CR>"] = "open",
  --   -- Открыть в вертикальном split
  --   ["o"] = "vsplit",
  --   -- Открыть в горизонтальном split
  --   ["O"] = "split",
  --   -- Открыть в новой вкладке
  --   ["t"] = "tab",
  --   -- Закрыть Yazi
  --   ["q"] = "close",
  --   -- Предпросмотр
  --   ["P"] = "preview",
  --   -- Поиск
  --   ["/"] = "search",
  --   -- Фильтр
  --   ["f"] = "filter",
  --   -- Сортировка
  --   ["s"] = "sort",
  --   -- Создать файл/папку
  --   ["a"] = "create",
  --   -- Переименовать
  --   ["r"] = "rename",
  --   -- Удалить
  --   ["d"] = "remove",
  --   -- Копировать
  --   ["y"] = "copy",
  --   -- Вырезать
  --   ["x"] = "cut",
  --   -- Вставить
  --   ["p"] = "paste",
  -- },
  -- === Продвинутые настройки ===
  -- Логирование
  log = {
    enabled = false,
    level = "info",
  },
  -- Таймаут для операций
  timeout_ms = 5000,
  -- Автоматически закрывать Yazi после открытия файла
  close_on_open = true,
  -- Показывать скрытые файлы по умолчанию
  show_hidden = false,
})
