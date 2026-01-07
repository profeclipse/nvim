return {
  "saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    "Kaiser-Yang/blink-cmp-dictionary",
  },
  version = "1.*",
  opts = {
    snippets = { preset = "luasnip" },
    keymap = { preset = "super-tab" },
    completion = {
      ghost_text = { enabled = true },
      list = { selection = { auto_insert = false } },
      documentation = { auto_show = true, window = { border = "rounded" } },
      menu = {
        draw = {
          padding = 0,
          columns = {
            { "kind_icon", gap = 1 },
            { gap = 1,     "label" },
            { "kind",      gap = 2 },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                return " " .. ctx.kind_icon .. " "
              end,
              highlight = function(ctx)
                return "BlinkCmpKindIcon" .. ctx.kind
              end,
            },
            kind = {
              text = function(ctx)
                return " " .. ctx.kind .. " "
              end,
            },
          },
        },
      },
    },
    sources = {
      default = {
        "lazydev",
        "lsp",
        "path",
        "snippets",
        "buffer",
        "dictionary",
        "copilot",
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        dictionary = {
          module = "blink-cmp-dictionary",
          min_keyword_length = 3,
        },
        lsp = {
          score_offset = 90,
        },
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          async = true,
          score_offset = -1,
        },
      },
    },
    fuzzy = { implementation = "lua" },
  },
  opts_extend = { "sources.default" },
}
