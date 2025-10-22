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
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "claude-code*",
			callback = function()
				local opts = { buffer = true, noremap = true, silent = true }

				-- Use jk or Ctrl-i to exit terminal/insert mode (Escape is used by Claude for interrupt/rewind)
				vim.keymap.set("t", "<C-j>", [[<C-\><C-n>]], vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))

				-- Start in insert mode when entering the buffer
				vim.cmd("startinsert")
			end,
		})
	end,
}
