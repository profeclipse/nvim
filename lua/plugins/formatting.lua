return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "lua_ls" },
        python = { "isort", "black" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        cmake = { "cmake_format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 3000,
      },
      formatters = {
        isort = {
          include_trailing_comma = true,
          command = "isort",
          args = {
            "--line-length",
            "120",
            "--lines-after-import",
            "2",
            "--quiet",
            "-",
          },
        },
        black = {
          command = "black",
          args = {
            "--line-length",
            "120",
            "--quiet",
            "-",
          },
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>cf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
