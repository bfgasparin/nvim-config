return {
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
