return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {},
	config = function()
		require("fzf-lua").setup({ "telescope" })

		vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files" })
		vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "Fuzzy grep files" })
		vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Fuzzy grep current buffer" })
		vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Fuzzy grep word under cursor" })
		--vim.keymap.set("n", "<leader>fh", builtin.help_tags)
		--vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols)
		--vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols)
	end,
}
