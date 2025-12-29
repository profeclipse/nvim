return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    opts = {
      winopts = {
        preview = {
          default = "bat",
        },
      },
    }
    require("fzf-lua").setup({ "telescope", "fzf-native" }, opts)

    vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files" })
    vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep<cr>", { desc = "Fuzzy grep files" })
    vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Fuzzy grep current buffer" })
    vim.keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Fuzzy grep word under cursor" })
    vim.keymap.set("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "Fuzzy search help tags" })
  end,
}
