-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  {
    "ayu-theme/ayu-vim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set ayu variant: 'light', 'mirage', or 'dark'
      vim.g.ayucolor = "dark"
      vim.cmd([[colorscheme ayu]])
    end,
  },
}
