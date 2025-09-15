-- vim.g.mapleader = " "
vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 3
vim.o.softtabstop = 3
-- vim.o.shiftwidth = 3
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.wrap = false

-- vim.o.hlsearch = false
-- vim.o.incsearch = true

vim.o.swapfile = false
vim.o.backup = false
-- vim.opt.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.scrolloff = 8
-- vim.o.updatetime = 50
-- vim.o.lpl = true
-- Auto changes the directory for the nvim to point to current directory
vim.o.autochdir = true
