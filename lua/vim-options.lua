-- disable netrw at the very start of init.lua (required for nvim-tree) to work properly
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

-- Enable break indent
vim.opt.breakindent = true

vim.opt.cursorline = true
-- vim.opt.clipboard = 'unnamedplus'
-- vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.autoread = true

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

