return {
  --dir = "~/Projects/fterm/fterm.nvim",
  "profeclipse/fterm.nvim",
  lazy = false,
  enabled = true,
  config = function()
    require("fterm").setup()

    vim.keymap.set("n", "<leader>tt", "<cmd>:Fterm<cr>", { desc = "Toggle floating terminal" })
  end,
}
