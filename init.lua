-- Set leader key before loading plugins
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Load configuration
require("config.options")
require("config.lazy")
require("config.keymaps")

