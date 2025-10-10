-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set

-- Clear search highlights
map("n", "<C-l>", ":nohlsearch<CR>", { silent = true })

-- Buffer navigation
map("n", ";j", ":bnext<CR>", { desc = "Next buffer", silent = true })
map("n", ";k", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
map("n", ";c", ":bdelete<CR>", { desc = "Close buffer", silent = true })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", { silent = true })
map("n", "<C-Down>", ":resize -2<CR>", { silent = true })
map("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })

-- Stay in indent mode
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

-- Move text up and down
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
