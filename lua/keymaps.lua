-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- switch between current and last buffer
vim.keymap.set('n', '<leader>.', '<C-^>', { desc = 'Switch between current and last buffer'})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear search highlight'})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickly change windows size
vim.keymap.set('n', '<left>', '<C-w>3<')
vim.keymap.set('n', '<right>', '<C-w>3>')
vim.keymap.set('n', '<up>', '<C-w>3+')
vim.keymap.set('n', '<down>', '<C-w>3-')

-- unload and delete current buffer from the list
vim.keymap.set('n', '<leader>d', '<cmd>bd<CR>')

-- quickfix windoe
vim.keymap.set('n', '<leader>wq', '<cmd>copen<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands
