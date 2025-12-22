--[[
local function has_compile_commands()
  local root = vim.fn.getcwd()
  return vim.loop.fs_stat(root .. "/compile_commands.json") ~= nil
end

if has_compile_commands() then
  vim.lsp.config.clangd = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = { "clangd", "--background-index", "--header-insertion=never" },
  }
else
  vim.notify("No compile_commands.json found — skipping clangd", vim.log.levels.WARN)
end
]]
