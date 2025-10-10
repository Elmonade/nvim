-- ~/.config/nvim/lua/plugins/terminal.lua

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal", mode = { "n", "t" } },
	},
	opts = {
		size = 20,
		open_mapping = [[<C-\>]],
		hide_numbers = true,
		shade_terminals = false,
		start_in_insert = true,
		insert_mappings = true,
		terminal_mappings = true,
		persist_size = true,
		persist_mode = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			width = function()
				return math.floor(vim.o.columns * 0.8)
			end,
			height = function()
				return math.floor(vim.o.lines * 0.9)
			end,
			winblend = 0,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Terminal keymaps
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-l>", "<C-l>", { desc = "Clean the terminal window like a sane person." })
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
	end,
}
