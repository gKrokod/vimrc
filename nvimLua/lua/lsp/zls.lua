-- lua/lsp/zls.lua


vim.lsp.config("zls", {
  cmd = { "C:/Tools/zls017/zls.exe" },
  filetypes = { "zig" },

  root_markers = {
    "build.zig",
    ".git",
  },
})

-- clear = true предотвращает дублирование автокоманд
-- при повторной загрузке конфигурации.
local group = vim.api.nvim_create_augroup("ZigFormatOnSave", {
  clear = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = { "*.zig", "*.zon" },
  desc = "Форматирование Zig через ZLS перед сохранением",

  callback = function(ev)
    -- Если ZLS не подключён, просто сохраняем файл.
    local clients = vim.lsp.get_clients({
      bufnr = ev.buf,
      name = "zls",
    })

    if #clients == 0 then
      return
    end

    vim.lsp.buf.format({
      bufnr = ev.buf,
      async = false,
      timeout_ms = 3000,

      filter = function(client)
        return client.name == "zls"
      end,
    })
  end,
})
