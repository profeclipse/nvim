return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      border = "rounded",
      direction = "float",
    })
    local keymap = vim.keymap
    keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle floating terminal" })
  end,
}
