-- Fuzzy Finder (files, lsp, etc)
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.6',
    event = 'VimEnter',
    dependencies = { 
      'nvim-lua/plenary.nvim',
      { -- add fzf support for sorting performance improvement and allow calculating score (cool search)
        -- unfortunatily this is the c implementation
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
        config = function()
          -- Enable Telescope extensions in telescope
          require('telescope').load_extension('fzf')
        end
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          local actions = require "telescope.actions"

          require("telescope").setup {
            extensions = {
              ["ui-select"] = {
                require("telescope.themes").get_dropdown {}
              }
            },
            pickers = {
              buffers = {
                mappings = {
                  i = {
                    ["<M-d>"] = actions.delete_buffer,
                  },
                  n = {
                    ["d"] = actions.delete_buffer,
                  }
                }
              }
            }
          }

          -- load the extension in telescope
          require("telescope").load_extension("ui-select")
        end,
      }
    },
    opts = {
      defaults = {
        file_ignore_patterns = { "^public/" },
      },
    },
    config = function(plugin, opts)
      require("telescope").setup(opts)
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>f?', builtin.help_tags, { desc = '[F]ind in Help [?]' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
      vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
      vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>g', builtin.git_status, { desc = 'Find in Git Status' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })

      -- Find file in vendor
      vim.keymap.set('n', '<leader>fv', function()
        builtin.find_files({
          search_dirs = { 'vendor' },
          prompt_title = 'Find Files in Vendor',
        })
      end, { desc = 'Find in [V]endors' })

      -- search in vendor dir
      vim.keymap.set('n', '<leader>fV', function()
        builtin.live_grep({
          search_dirs = { 'vendor' },
          prompt_title = 'Live Grep in Vendors',
        })
      end, { desc = 'Find by Grep in [V]endors' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[F]find in [N]eovim files' })

      -- Search on current buffer
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })
    end,
  },
}
