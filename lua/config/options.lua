vim.cmd("let g:netrw_liststyle = 3")

vim.g.loaded_perl_provider = 0 -- tell plugins to ignore perl

local opt = vim.opt

opt.number = true                  -- enable line numbers
opt.relativenumber = true          -- enable relative line numbers
opt.signcolumn = "yes"             -- always show sign column (for contextual information signs)

opt.cursorline = true              -- highlight current line
opt.scrolloff = 999                -- keep cursor on middle line unless near start/end of file

opt.tabstop = 4                    -- set tab size
opt.shiftwidth = 4                 -- set indent size for >> and <<
opt.expandtab = true               -- expand tabs to spaces
opt.autoindent = true              -- copy indent from current line when starting new line
opt.smartindent = true             -- indent correctly after {

opt.wrap = false                   -- turn off text wrapping

opt.ignorecase = true              -- case-insensitive search
opt.smartcase = true               -- case-sensitive when pattern contains upper-case chars
opt.incsearch = true               -- incremental search

opt.termguicolors = true           -- enable 24-bit color
opt.background = "dark"            -- set default background to dark

opt.backspace = "indent,eol,start" -- make backspace smarter

opt.clipboard = "unnamedplus"      -- use system clipboard as default register

opt.splitright = true              -- split vertical window to the right
opt.splitbelow = true              -- split horizontal window to the bottom

opt.swapfile = false               -- disable swap file

vim.o.winborder = "rounded"        -- use rounded border for windows
