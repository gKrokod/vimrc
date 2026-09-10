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
vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.modeline = false

vim.opt.path:append("**")
vim.opt.wildmenu = true

-- Тема PaperColor
vim.opt.background = "light"
