return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    log_level = "error",
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "~/Documents", "/" },
    auto_restore = false,
  },
  config = function(_, opts)
    auto_session = require("auto-session")
    auto_session.setup(opts)

    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    local set = vim.keymap.set
    set("n", "<leader>ws", "<cmd>AutoSession save<cr>", { desc = "Save Session" })
    set("n", "<leader>wr", "<cmd>AutoSession restore<cr>", { desc = "Restore Session" })
  end,
}
