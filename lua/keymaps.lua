-- switch between current and last buffer
vim.keymap.set('n', '<leader>.', '<c-^>', { desc = 'Switch between current and last buffer'})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear search highlight'})
