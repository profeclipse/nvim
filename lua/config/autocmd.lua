-- hightlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- auto-resize splits when terminal window resized
vim.api.nvim_create_autocmd("VimResized", {
  desc = "Resize splits when terminal window resized",
  command = "wincmd =",
})

-- don't auto-continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
  desc = "Don't auto-continue comments on new line",
  group = vim.api.nvim_create_augroup("no_auto_comment", {}),
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
