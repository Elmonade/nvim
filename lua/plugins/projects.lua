-- ~/.config/nvim/lua/plugins/projects.lua

return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      -- Detection methods
      detection_methods = { "pattern", "lsp" },
      
      -- Patterns to detect project root
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" , "Cargo.json"},
      
      -- Don't show hidden files in telescope
      show_hidden = false,
      
      -- Silent chdir
      silent_chdir = true,
      
      -- Path to store project history
      datapath = vim.fn.stdpath("data"),
    })
    
    -- Integrate with telescope
    require("telescope").load_extension("projects")
  end,
}
