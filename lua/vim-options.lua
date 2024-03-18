-- disable netrw at the very start of your init.lua 
-- (required for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set up the leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- enable 24-bit colour
vim.opt.termguicolors = true

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Make line numbers default
 vim.opt.number = true

-- vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.cursorline = true
-- vim.opt.autoread = true

-- use space for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true