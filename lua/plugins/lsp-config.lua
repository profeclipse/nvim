return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has "nvim-0.11" == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = "kickstart-lsp-highlight", buffer = event2.buf }
              end,
            })
          end

          local function mapkey(modes, lhs, rhs, desc, opts)
            opts = opts or {}
            opts.desc = desc
            vim.keymap.set(modes, lhs, rhs, opts)
          end

          local opts = { buffer = event.buf, silent = true }

          mapkey("n", "gR", "<cmd>FzfLua lsp_references<cr>", "Show LSP references", opts)
          mapkey("n", "gD", vim.lsp.buf.declaration, "Go to declaration", opts)
          mapkey("n", "gd", vim.lsp.buf.definition, "Show LSP definition", opts)
          mapkey("n", "gi", "<cmd>FzfLua lsp_implementations<cr>", "Show LSP implementations", opts)
          mapkey("n", "gt", "<cmd>FzfLua lsp_typedefs<cr>", "Show LSP type definitions", opts)
          mapkey({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Show available code actions", opts)
          mapkey("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename", opts)
          mapkey("n", "<leader>D", "<cmd>FzfLua diagnostics_document<cr>", "Show buffer diagnostics", opts)
          mapkey("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics", opts)
          mapkey("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, "Go to previous diagnostic", opts)
          mapkey("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, "Go to next diagnostic", opts)
          mapkey("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor", opts)
          mapkey("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP", opts)
        end,
      })

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
        pyright = {},
      }

      for name, config in pairs(servers) do
        local config = config or {}
        config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
        vim.lsp.config(name, config)
      end
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
        "black",
        "isort",
        "pylint",
        "clang-format",
        "cmakelang",
      },
    },
  },
}
