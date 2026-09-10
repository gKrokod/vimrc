-- lua/plugins/oil.lua

require("oil").setup({
  -- Открывать Oil при `nvim .`, `:edit .`, :Explore-подобном сценарии.
  default_file_explorer = true,

  -- У тебя уже установлен nvim-web-devicons.
  columns = {
    "icon",
  },

  -- Сразу отображать скрытые файлы.
  view_options = {
    show_hidden = true,
  },

  -- При удалении стараться отправлять объект в Корзину Windows.
  delete_to_trash = true,

  keymaps = {
    ["<CR>"] = "actions.select",
    ["l"] = "actions.select",

    ["-"] = "actions.parent",
    ["h"] = "actions.parent",

    ["<C-l>"] = "actions.refresh",
    ["."] = "actions.toggle_hidden",

    ["q"] = "actions.close",
  },
})