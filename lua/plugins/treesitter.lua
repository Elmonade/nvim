-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Install parsers automatically
      auto_install = true,
      
      -- List of parsers to always install
      ensure_installed = {
        "rust",
        "lua",
        "vim",
        "vimdoc",
        "python",
        "javascript",
        "typescript",
        "c",
        "cpp",
        "json",
        "yaml",
        "markdown",
        "bash",
      },

      -- Enable syntax highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Enable indentation
      indent = {
        enable = true,
      },
    })
  end,
}
