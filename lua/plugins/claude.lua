return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup({
			window = {
				position = "vertical",
				float = {
					width = "90%", -- Take up 90% of the editor width
					height = "90%", -- Take up 90% of the editor height
					row = "center", -- Center vertically
					col = "center", -- Center horizontally
					relative = "editor",
					border = "double", -- Use double border style
				},
			},
		})

		-- Configure Claude buffers to behave like terminal windows
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "claude",
			callback = function()
				-- Map ESC to exit insert mode (like terminal mode)
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-l>", "<C-l>", { desc = "Clean the terminal window like a sane person." })

				-- Start in insert mode when entering the buffer
				vim.cmd("startinsert")
			end,
		})

		-- Auto-enter insert mode when entering Claude buffer
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			callback = function()
				if vim.bo.filetype == "claude" then
					vim.cmd("startinsert")
				end
			end,
		})
	end,
}
