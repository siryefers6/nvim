-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
vim.opt.number = true              -- Show line numbers
vim.opt.relativenumber = true      -- Show relative line numbers
vim.opt.mouse = ""                 -- Disable mouse support (keep keyboard-focused workflow)
vim.opt.termguicolors = true       -- True color support
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
vim.opt.ignorecase = true          -- Ignore case in search
vim.opt.smartcase = true           -- Override ignorecase if search contains uppercase
vim.opt.hlsearch = true            -- Highlight search results
vim.opt.incsearch = true           -- Incremental search
vim.opt.wrap = false               -- Don't wrap lines
vim.opt.splitbelow = true          -- Horizontal splits go below
vim.opt.splitright = true          -- Vertical splits go right
vim.opt.cursorline = true          -- Highlight current line
vim.opt.signcolumn = "yes"         -- Always show sign column
vim.opt.updatetime = 250           -- Faster completion
vim.opt.timeoutlen = 300           -- Time to wait for mapped sequence
vim.opt.completeopt = "menu,menuone,noselect"  -- Completion options

-- Indentation
vim.opt.tabstop = 2                -- Number of spaces tabs count for
vim.opt.shiftwidth = 2             -- Size of indent
vim.opt.expandtab = true           -- Use spaces instead of tabs
vim.opt.smartindent = true         -- Smart autoindenting

-- Backup and swap
vim.opt.backup = false             -- No backup file
vim.opt.swapfile = false           -- No swap file
vim.opt.undofile = true            -- Enable persistent undo

-- Performance
vim.opt.lazyredraw = true          -- Don't redraw while executing macros
vim.opt.hidden = true              -- Enable background buffers
