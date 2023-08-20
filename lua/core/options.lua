vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.cursorline = true

--mouse
vim.o.mousemoveevent = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line numbers
vim.wo.number = true

vim.opt.pumblend = 15
