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
			--name_formatter = function(buf)
				--return string.format("%-30s", buf.name)
			--end,
			indicator = {
				style = "icon",
				icon = "  >",
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
			  text = "-_-",
			  text_align = "center",
			  highlight = "NvimTreeOffsetText",
			  separator = true,
		  },
	  },
	  show_duplicate_prefix = true,
	  persist_buffer_sort = true,
	  separator_style = { "", "" },
	  color_icons = false,
	  show_buffer_icons = false,
	  show_buffer_close_icons = false,
	  show_close_icon = false,
	  show_indicators = false,
	  show_tab_indicators = false,
	  enforce_regular_tabs = false,
	  always_show_bufferline = false,
	  sort_by = "id",
  },
  highlights = {
	  -- Background fill
	  fill = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = { attribute = "bg", highlight = "Normal" },
	  },
	  offset_separator = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = { attribute = "bg", highlight = "Normal" },
	  },
	  -- Inactive buffer
	  background = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#555555",
	  },
	  -- Active/selected buffer
	  buffer_selected = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#eeeeee",
	  },
	  -- Visible buffer: Currently selected by focus is outside the buffer window.
	  buffer_visible = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#eeeeee",
	  },
	  -- Numbers
	  numbers = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#555555",
	  },
	  numbers_selected = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#eeeeee",
	  },
	  numbers_visible = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#eeeeee",
	  },
	  -- Indicators
	  indicator_selected = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#ff0055",
	  },
	  indicator_visible = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#ff0055",
	  },
	  -- Modified indicator
	  modified = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#00ff55",
	  },
	  modified_selected = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#00ff55",
	  },
	  modified_visible = {
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = "#00ff55",
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
		  fg = { attribute = "bg", highlight = "Normal" },
		  bg = { attribute = "bg", highlight = "Normal" },
	  },
	  tab_close = {
		  bg = { attribute = "bg", highlight = "Normal" },
	  },
  },
  },
  config = function(_, opts)
    -- Create custom highlight group for NvimTree offset BEFORE setup
    local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
    if not normal_bg then
      normal_bg = 0x0f1419  -- ayu dark background as fallback
    end

    vim.api.nvim_set_hl(0, "NvimTreeOffsetText", {
      fg = 0xcbccc6,  -- Light gray text (ayu default foreground)
      bg = normal_bg
    })

    require("bufferline").setup(opts)

    -- Also set after colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or 0x0f1419
        vim.api.nvim_set_hl(0, "NvimTreeOffsetText", {
          fg = 0xcbccc6,
          bg = bg
        })
      end
    })
  end,
}
