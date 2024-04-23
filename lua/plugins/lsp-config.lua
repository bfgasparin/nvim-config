return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "intelephense", "tsserver", "volar", "tailwindcss" }
    },
  },
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    config = function()

      -- for default servers configuration, check:
      -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      
      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup language servers.
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.intelephense.setup {
        capabilities = capabilities
      }
      lspconfig.tailwindcss.setup {
        capabilities = capabilities
      }

      --
      -- Run `volar` in hybrid mode. d. In this mode, the volar exclusively manages the CSS/HTML section for `.vue`
      -- files and tsserver manages the rest.  tsserver still is resmposible for `.ts` and `.js` files.
      -- For more details check: 
      --   - https://github.com/vuejs/language-tools/blob/e0f2d43f9aab17eb27e28893aa1ffcade51927b6/README.md?plain=1#L61
      --   - https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/volar.lua
      --   - https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/tsserver.lua
      --
      lspconfig.tsserver.setup {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              -- IMPORTANT: It is crucial to ensure that @vue/typescript-plugin and volar are of identical versions.
              location = "/Users/brunofermegasparin/Library/pnpm/global/5/node_modules/@vue/typescript-plugin",
              languages = {"javascript", "typescript", "vue"},
            },
          },
        },
        filetypes = {
          "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue",
        },
      }
      -- No need to set `hybridMode` to `true` as it's the default value
      lspconfig.volar.setup {
        capabilities = capabilities,
      }

      --  This function gets run when an LSP attaches to a particular buffer.
      --    Use LspAttach autocommand to only map the following keys
      --    after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <C-x><C-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
          end

          --
          -- Buffer local mappings.
          --

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', function()
            require('telescope.builtin').lsp_references({
              fname_width = 45,
              trim_text = true,
            })
          end, '[G]oto [R]eferences')

          -- For below mappings, see `:help vim.lsp.*` for documentation

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      end,
      })
    end
  }
}
