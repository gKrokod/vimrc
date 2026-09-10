-- lua/lsp/clangd.lua

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp" },
  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    "CMakeLists.txt",
    "Makefile",
    ".git",
  },
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
})
