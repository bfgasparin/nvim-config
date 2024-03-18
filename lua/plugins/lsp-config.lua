return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "tsserver" }
    },
  },
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup language servers.
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }
      lspconfig.tsserver.setup {
        capabilities = capabilities
      }

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      end,
      })
    end
  }
}
