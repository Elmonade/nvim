-- Set leader key before loading plugins
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Load configuration
require("config.options")
require("config.lazy")
require("config.keymaps")

-- Remove window separator
vim.api.nvim_set_hl(0, "WinSeparator", {
    fg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
    bg = "NONE"
})

-- Remove empty line indicators
vim.api.nvim_set_hl(0, "EndOfBuffer", {
    fg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
    bg = "NONE"
})
-- NvimTree top bar background
vim.api.nvim_set_hl(0, "NvimTreeNormal", {
    bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
})
vim.api.nvim_set_hl(0, "NvimTreeNormalNC", {
    bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
})

-- Auto close brackets
require("autoclose").setup()
