-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  keys = {
    { ";ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { ";fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    { ";fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    { ";fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    { ";fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" , "target"},
        layout_config = {
          horizontal = { preview_width = 0.6 },
        },
      },
    })
  end,
}
