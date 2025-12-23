return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lsp.lua_ls")
      require("lsp.pyright")
      require("lsp.marksman")
      require("lsp.cmake")
      require("lsp.clangd")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettier",
        --"stylua",
        "black",
        "isort",
        "pylint",
        "clang-format",
        "cmakelang",
      },
    },
  },
}
