-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- switch between current and last buffer
vim.keymap.set('n', '<leader>.', '<C-^>', { desc = 'Switch between current and last buffer'})

vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight'})

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>l', vim.diagnostic.setloclist, { desc = 'Open diagnostic in [L]ocation list' })
vim.keymap.set('n', '<leader>q', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    local action = qf_winid > 0 and 'cclose' or 'copen'
    vim.cmd('botright '..action)
end, { desc = 'Open [Q]uickfix list' })

-- Quickly change windows size
vim.keymap.set('n', '<left>', '<C-w>3<')
vim.keymap.set('n', '<right>', '<C-w>3>')
vim.keymap.set('n', '<up>', '<C-w>3+')
vim.keymap.set('n', '<down>', '<C-w>3-')

-- save the current buffer
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')

-- unload and delete current buffer from the list
vim.keymap.set('n', '<leader>d', '<cmd>bd<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands
