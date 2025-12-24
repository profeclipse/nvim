local set = vim.opt_local

-- set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", {}),
  callback = function()
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0

    vim.bo.filetype = "terminal"
  end,
})

-- make it easier to return to terminal mode in terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Return to normal mode" })

-- Open terminal at bottom of screen with fixed height
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd.new()
  vim.cmd.wincmd "J"
  vim.api.nvim_win_set_height(0, 14)
  vim.wo.winfixheight = true
  vim.cmd.term()
end, { desc = "Open terminal at bottom of screen" })
