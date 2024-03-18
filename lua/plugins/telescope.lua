-- Fuzzy Finder (files, lsp, etc)
return {
  {
    "vim-telescope/telescope.nvim",
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
      vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = 'Find Files' })
    end,
  },
--[[  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }

      -- load the extension in telescope
      require("telescope").load_extension("ui-select")
    end,
  }]]--
}
