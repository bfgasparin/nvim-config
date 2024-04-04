-- Fast and bealtiful statusline
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      disabled_filetypes = { 'NvimTree' },
      globalstatus = true,
    },
    sections = {
      -- lualine_a = {'branch', 'diff', 'diagnostics'},
      lualine_c = {
        {
          'buffers',
          show_filename_only = true,   -- Shows shortened relative path when set to false.
          hide_filename_extension = false,   -- Hide filename extension when set to true.
          show_modified_status = true, -- Shows indicator when the buffer is modified.

          mode = 4, -- 0: Shows buffer name
          -- 1: Shows buffer index
          -- 2: Shows buffer name + buffer index
          -- 3: Shows buffer number
          -- 4: Shows buffer name + buffer number

          max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
          -- it can also be a function that returns
          -- the value of `max_length` dynamically.

          -- Automatically updates active window color to match color of other components (will be overidden if buffers_color is set)
          use_mode_colors = false,
        }
      },
    },
  }
}
