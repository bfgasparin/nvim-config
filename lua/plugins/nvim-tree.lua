-- File explorer and dir tree navigation
return { 
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup {
      view = {
        width = 45,
      },
      filters = {
        dotfiles = true,
      },
    }

    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')
  end,
}
