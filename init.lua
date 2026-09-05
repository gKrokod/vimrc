-- Onedark/старые плагины не нужны; ниже — ленивая загрузка
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- ============================================================
-- init.lua — Neovim
-- Перенесено из ~/.vimrc (vim-plug -> lazy.nvim, coc -> LSP)
-- ============================================================

vim.g.mapleader = "\\"
-- vim.g.maplocalleader = "\\"

-- Базовые настройки (как было во .vimrc)
-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.tabstop = 2          -- сколько пробелов показывает таб
vim.opt.shiftwidth = 2       -- шаг отступа
vim.opt.expandtab = true     -- таб -> пробелы
vim.opt.incsearch = true     -- инкрементальный поиск
vim.opt.hlsearch = false     -- без подсветки найденного (как во .vimrc)
vim.opt.mouse = "a"
vim.opt.termguicolors = true   -- 24-бит цвет в Windows Terminal (PaperColor точнее)
vim.opt.listchars = { tab = "→ ", eol = "↲" }
vim.opt.list = true          -- показывать таб/eol
-- new subwindow right
vim.opt.splitright = true
-- new subwindow bottom
vim.opt.splitbelow = true
-- колонка каких-то диагностических знаков, разобраться с git
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"  -- системный буфер обмена
-- отключает создание swap файлов, нет заиты от падений, но мусора меньше
vim.opt.swapfile = false
-- Включает постоянный undo (undo-файлы на диске). todo google
vim.opt.undofile = true
vim.opt.modeline = false
-- vim.opt.scrolloff = 8
--
vim.opt.path:append("**")    -- :find по всем подкаталогам
vim.opt.wildmenu = true      -- множественные совпадения

-- Сокращения

-- Отключаем стрелки в normal-режиме (как было)
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")

-- Выход в normal по kj
vim.keymap.set("i", "kj", "<ESC>")
vim.keymap.set("i", "KJ", "<ESC>")

-- Quickfix: навигация (если понадобится :cfile)
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprevious<CR>")

-- Открыть файл настроек: \ev
vim.keymap.set("n", "<leader>ev", "<cmd>edit $MYVIMRC<CR>", { desc = "Открыть init.lua" })

-- Сохранение свёрток (как было); pcall — первый раз view-файла ещё нет
vim.api.nvim_create_autocmd("BufWinLeave", { pattern = "*.*", callback = function() pcall(vim.cmd.mkview) end })
vim.api.nvim_create_autocmd("BufWinEnter", { pattern = "*.*", callback = function() pcall(vim.cmd.loadview) end })


local plugins = {
  -- Тема PaperColor (светлая)
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"
      vim.cmd.colorscheme("PaperColor")
    end,
  },

  -- Синтаксис/отступы Haskell
  { "raichoo/haskell-vim", ft = "haskell" },

  -- Корень проекта (как airblade/vim-rooter)
  {
    "airblade/vim-rooter",
    config = function() vim.g.rooter_patterns = { ".git", "Makefile", "CMakeLists.txt", "stack.yaml", "cabal.project" } end,
  },

  -- Дерево файлов (вместо NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "Дерево файлов" } },
    config = function()
      local tree = require("nvim-tree")
      tree.setup({
        view = { width = 35 },
        renderer = { group_empty = true, indent_markers = { enable = true } },
        filters = { dotfiles = false },
      })
    end,
  },

  -- Комментирование строк: gcc / gc (как tcomment)
  {
    "tomtom/tcomment_vim",
    keys = {
      { "gc", mode = { "n", "x" } },
      { "gcc", mode = "n" },
      { "<C-h>", ":TComment<CR>", mode = { "n", "x" }, desc = "Закомментировать строку/блок" },
    },
  },

  -- Поиск фаззер (telescope)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Найти файлы" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Поиск по тексту" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Буферы" },
    },
  },


  -- Статус-лайн
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "PaperColor",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  },
-- {
--   "data": [
--     {
--       "id": "qwen/qwen3.5-9b",
--       "object": "model",
--       "owned_by": "organization_owner"
--     },
--     {
--       "id": "text-embedding-nomic-embed-text-v1.5",
--       "object": "model",
--       "owned_by": "organization_owner"
--     }
--   ],
--   "object": "list"
-- }
  -- Подсказки клавиш по leader
  { "folke/which-key.nvim", config = function() require("which-key").setup({}) end },

  -- Локальный AI-помощник в Neovim:
  -- CodeCompanion -> LM Studio -> загруженная Qwen
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    keys = {
      {
        "<leader>ai",
        "<cmd>CodeCompanionChat Toggle<CR>",
        desc = "AI: открыть или закрыть чат",
      },
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<CR>",
        desc = "AI: меню действий",
        mode = { "n", "v" },
      },
      {
        "<leader>ae",
        "<cmd>CodeCompanion<CR>",
        desc = "AI: запрос к коду",
        mode = { "n", "v" },
      },
    },

    opts = {
      adapters = {
        opts = {
          -- Чтобы в меню не было десятков ненужных облачных провайдеров
          show_defaults = false,

          -- Не спрашивать каждый раз выбор модели:
          -- будет использоваться model.default ниже
          show_model_choices = false,
        },

        http = {
          lmstudio = function()
            return require("codecompanion.adapters").extend(
              "openai_compatible",
              {
                name = "LM Studio",

                env = {
                  -- Адрес локального API LM Studio
                  url = "http://127.0.0.1:1234",

                  -- LM Studio обычно не проверяет ключ,
                  -- но CodeCompanion ожидает непустую строку
                  api_key = "lm-studio",

                  -- Полный адрес получится:
                  -- http://127.0.0.1:1234/v1/chat/completions
                  chat_url = "/v1/chat/completions",

                  -- Используется для получения списка моделей
                  models_endpoint = "/v1/models",
                },

                schema = {
                  model = {
                    -- ВАЖНО:
                    -- замени на точное имя модели из LM Studio API.
                    default = "qwen/qwen3.5-9b",
                  },

                  -- Для программирования лучше невысокая температура:
                  -- меньше фантазии, больше повторяемости.
                  temperature = {
                    default = 0.2,
                  },
                },
              }
            )
          end,
        },
      },

      strategies = {
        -- Обычный AI-чат в отдельном буфере
        chat = {
          adapter = "lmstudio",
        },

        -- Запросы к выделенному коду / inline-изменения
        inline = {
          adapter = "lmstudio",
        },
      },
    },
  },
}

require("lazy").setup(plugins)
