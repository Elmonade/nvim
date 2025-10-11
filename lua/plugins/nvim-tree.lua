-- ~/.config/nvim/lua/plugins/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  keys = {
    { ";e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
    { ";n", "<cmd>NvimTreeFindFile<cr>", desc = "Find in File Explorer" },
  },
  config = function()
    -- Disable netrw (recommended by nvim-tree)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      -- Sync with current buffer
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },

      view = {
        width = 30,
        side = "left",
      },

      renderer = {
        highlight_opened_files = "name", -- highlights just the name without icons
        highlight_git = true,
        root_folder_label = false,
        indent_markers = {
          enable = false,
        },
        icons = {
          show = {
            file = false,        -- No file icons
            folder = false,      -- No folder icons
            folder_arrow = true, -- Keep arrows like NERDTree
            git = false,         -- No git icons
          },
          glyphs = {
            folder = {
              arrow_closed = "▸",
              arrow_open = "▾",
            },
          },
        },
      },

      filters = {
        dotfiles = false, -- Show hidden files (like NERDTreeShowHidden)
        custom = { "^\\.git$", "^\\.DS_Store$", "^node_modules$" },
      },

      git = {
        enable = true,
        ignore = false,
      },

      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    })

    -- Auto-close if it's the last window
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local tree_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(tree_wins, w)
          end
          if vim.api.nvim_win_get_config(w).relative ~= '' then
            table.insert(floating_wins, w)
          end
        end
        if 1 == #wins - #floating_wins - #tree_wins then
          for _, w in ipairs(tree_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end
    })
  end,
}
