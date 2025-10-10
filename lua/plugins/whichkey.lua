-- ~/.config/nvim/lua/plugins/whichkey.lua

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({})

    -- Register key groups
    wk.add({
      { ";f", group = "Find" },
      { ";e", desc = "File Explorer" },
      { ";j", desc = "Next Buffer" },
      { ";k", desc = "Previous Buffer" },
      { ";c", desc = "Close Buffer" },
    })
  end,
}
