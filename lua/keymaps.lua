-- switch between current and last buffer
vim.keymap.set('n', '<leader>.', '<c-^>', { desc = 'Switch between current and last buffer'})

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { desc = 'Clear search highlight'})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quickly change windows size
vim.keymap.set('n', '<left>', '<c-w>3<')
vim.keymap.set('n', '<right>', '<c-w>3>')
vim.keymap.set('n', '<up>', '<c-w>3+')
vim.keymap.set('n', '<down>', '<c-w>3-')
