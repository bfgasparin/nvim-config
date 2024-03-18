-- set up the leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- enable 24-bit colour
vim.opt.termguicolors = true

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

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

-- switch between current and last buffer
vim.keymap.set('n', '<leader>.', '<c-^>', {})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
