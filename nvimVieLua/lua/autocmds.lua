vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function()
    pcall(vim.cmd.mkview)
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    pcall(vim.cmd.loadview)
  end,
})
