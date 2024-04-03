-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

--
-- buffers 
--
-- save the current buffer
vim.keymap.set('n', ',w', '<cmd>w<CR>', { desc = '[W]rite buffer to the current file' })
-- unload and delete current buffer from the list
vim.keymap.set('n', ',d', '<cmd>bd<CR>', { desc = 'Unload buffer and [D]elete it from the buffer list' })
-- go to the next buffer in the buffer list
vim.keymap.set('n', '<Space>]', '<cmd>bn<CR>', { desc = 'Go to next buffer in the buffer list' })
-- go to the previous buffer in the buffer list
vim.keymap.set('n', '<Space>[', '<cmd>bp<CR>', { desc = 'Go to previous buffer in the buffer list' })
-- switch between current and last buffer
vim.keymap.set('n', '<Space>.', '<C-^>', { desc = 'Switch between current and last buffer'})

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open diagnostic in [L]ocation list' })
vim.keymap.set('n', '<leader>q', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    local action = qf_winid > 0 and 'cclose' or 'copen'
    vim.cmd('botright '..action)
end, { desc = 'Open [Q]uickfix list' })

-- Quickly change windows size
vim.keymap.set('n', '<right>', '<C-w>3>', { desc = 'Increase current window width by 3' })
vim.keymap.set('n', '<left>', '<C-w>3<', { desc = 'Decrease current window width by 3' })
vim.keymap.set('n', '<up>', '<C-w>3+', { desc = 'Increase current window height by 3' })
vim.keymap.set('n', '<down>', '<C-w>3-', { desc = 'Decrease current window height by 3' })

-- highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight'})

-- Laravel artisan
vim.keymap.set('n', '<leader><leader>lt', function()
    local action = '| terminal docker compose exec api php artisan tinker'
    vim.cmd('botright new ' ..action)
end, { desc = 'Enter on [L]aravel [T]inker'})

vim.keymap.set('n', '<leader><leader>da', function()
    local action = '| terminal docker compose exec api bash'
    vim.cmd('botright new ' ..action)
end, { desc = 'Enter on [D]ocker [A]PI container'})


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands
