-- File explorer and dir tree navigation
return { 
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = {
      width = 45,
    },
    filters = {
      dotfiles = true,
    },
  },
  config = function(plugin, opts)
    require("nvim-tree").setup(opts)

    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
  end,
}
