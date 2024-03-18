-- the colorscheme should be available when starting Neovim
return {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
    },
    config = function() 
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
}
