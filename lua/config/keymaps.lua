vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function mapkey(modes, lhs, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set(modes, lhs, rhs, opts)
end

mapkey("t", "<Esc><Esc>", "<C-\\><C-n>", "Return to normal mode")

mapkey("n", ",,", "<cmd>nohl<CR>", "Clear search highlights")

mapkey("n", "<leader>+", "<C-a>", "Increment number")
mapkey("n", "<leader>-", "<C-x>", "Decrement number")

-- window management
mapkey("n", "<leader>sv", "<C-w>v", "Split window vertically")
mapkey("n", "<leader>sh", "<C-w>s", "Split window horizontally")
mapkey("n", "<leader>se", "<C-w>=", "Make splits equal size")
mapkey("n", "<leader>sx", "<cmd>close<CR>", "Close current split")

mapkey("n", "<leader>to", "<cmd>tabnew<CR>", "Open new tab")
mapkey("n", "<leader>tx", "<cmd>tabclose<CR>", "Close current tab")
mapkey("n", "<leader>tn", "<cmd>tabn<CR>", "Go to next tab")
mapkey("n", "<leader>tp", "<cmd>tabp<CR>", "Go to previous tab")
mapkey("n", "<leader>tf", "<cmd>tabnew %<CR>", "Open current buffer in a new tab")

mapkey("n", "<C-h>", "<C-w><C-h>", "Move to left window")
mapkey("n", "<C-l>", "<C-w><C-l>", "Move to right window")
mapkey("n", "<C-j>", "<C-w><C-j>", "Move to below window")
mapkey("n", "<C-k>", "<C-w><C-k>", "Move to above window")

-- move line(s) up and down
mapkey("n", "<A-j>", ":m +1<CR>", "Move line down")
mapkey("n", "<A-k>", ":m -2<CR>", "Move line up")
mapkey("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move selection down")
mapkey("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move selection up")

-- lsp keymaps
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     local opts = { buffer = ev.buf, silent = true }
--
--     mapkey("n", "gR", "<cmd>FzfLua lsp_references<cr>", "Show LSP references", opts)
--     mapkey("n", "gD", vim.lsp.buf.declaration, "Go to declaration", opts)
--     mapkey("n", "gd", vim.lsp.buf.definition, "Show LSP definition", opts)
--     mapkey("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", "Show LSP implementations", opts)
--     mapkey("n", "gt", "<cmd>FzfLua lsp_typedefs<cr>", "Show LSP type definitions", opts)
--     mapkey({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Show available code actions", opts)
--     mapkey("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename", opts)
--     mapkey("n", "<leader>D", "<cmd>FzfLua diagnostics_document<cr>", "Show buffer diagnostics", opts)
--     mapkey("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics", opts)
--     mapkey("n", "[d", function()
--       vim.diagnostic.jump({ count = -1, float = true })
--     end, "Go to previous diagnostic", opts)
--     mapkey("n", "]d", function()
--       vim.diagnostic.jump({ count = 1, float = true })
--     end, "Go to next diagnostic", opts)
--     mapkey("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor", opts)
--     mapkey("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP", opts)
--   end,
-- })
