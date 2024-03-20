-- the colorscheme should be available when starting Neovim
return {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
    },
    config = function(plugin, opts) 
      require'catppuccin'.setup(opts)

      vim.cmd.colorscheme "catppuccin"
    end
}
