-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  keys = {
    { ";j", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { ";k", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous Buffer" },
    { ";c", "<cmd>bdelete<cr>", desc = "Close Buffer" },
    { ";1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to Buffer 1" },
    { ";2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to Buffer 2" },
    { ";3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to Buffer 3" },
    { ";4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to Buffer 4" },
    { ";5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to Buffer 5" },
  },
  opts = {
    options = {
      mode = "buffers",
      themable = true,
      numbers = "ordinal",
      close_command = "bdelete! %d",
      indicator = {
        icon = "▎",
        style = "icon",
      },
      modified_icon = "●",
      max_name_length = 18,
      max_prefix_length = 15,
      truncate_names = true,
      tab_size = 18,
      diagnostics = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      color_icons = false,
      show_buffer_icons = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      show_duplicate_prefix = true,
      persist_buffer_sort = true,
      separator_style = "thin",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      hover = {
        enabled = false,
        delay = 200,
        reveal = { "close" },
      },
      sort_by = "id",
    },
    highlights = {
      -- Background fill
      fill = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Inactive buffer
      background = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Active/selected buffer
      buffer_selected = {
        bg = { attribute = "bg", highlight = "Normal" },
        bold = true,
        italic = false,
      },
      -- Visible buffer
      buffer_visible = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Numbers
      numbers = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      numbers_selected = {
        bg = { attribute = "bg", highlight = "Normal" },
        bold = true,
      },
      numbers_visible = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Indicators
      indicator_selected = {
        fg = { attribute = "fg", highlight = "Function" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      indicator_visible = {
        fg = { attribute = "fg", highlight = "Comment" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Modified indicator
      modified = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      modified_selected = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      modified_visible = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Duplicates
      duplicate = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      duplicate_selected = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      duplicate_visible = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Separators
      separator = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      separator_selected = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      separator_visible = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
      },
      -- Tab
      tab = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      tab_selected = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
      tab_close = {
        bg = { attribute = "bg", highlight = "Normal" },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
