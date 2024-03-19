return   {
  {
    -- Integration with git commands
    "tpope/vim-fugitive",
    {-- Adds git related signs to the gutter, as well as utilities for managing changes
      'lewis6991/gitsigns.nvim',
      config = true,
    }
  },
  { -- git terminal UI
    "kdheepak/lazygit.nvim",
    keys = {
      {'<leader>g', '<cmd>LazyGit<CR>', { desc = 'Open Lazy[G]it UI'}},
    },
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  }
}
