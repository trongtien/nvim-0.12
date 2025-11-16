vim.cmd([[set noswapfile]])
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

vim.opt.updatetime = 800
vim.opt.timeoutlen = 500
vim.opt.synmaxcol = 180
vim.opt.redrawtime = 800
vim.opt.maxmempattern = 1500
vim.opt.lazyredraw = true
vim.opt.hidden = true
vim.opt.history = 50

-- Giảm LSP load
vim.g.lsp_semantic_enabled = 0
vim.g.code_action_menu_window_border = "none"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.shadafile = "NONE"

vim.opt.termguicolors = true

vim.opt.winborder = "rounded"
vim.opt.tabstop = 2
vim.opt.expandtab = true -- use appropriate number of spaces with tab
vim.opt.softtabstop = 2 -- how many spaces tab inserts
vim.opt.shiftwidth = 2
vim.opt.showtabline = 0 -- Ẩn tabline để tiết kiệm RAM
vim.opt.signcolumn = "auto" -- Chỉ show khi cần
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.cursorline = false -- Tắt cursorline
vim.opt.list = false -- Tắt list chars
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undolevels = 500 -- Giảm undo history
vim.opt.undoreload = 5000 -- Giảm số dòng reload cho undo
vim.opt.backup = false -- Tắt backup
vim.opt.writebackup = false -- Tắt writebackup
vim.opt.number = true
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.autoindent = true -- copy indent from current line when starting new line
vim.opt.scrolloff = 8 -- always keep 8 lines above/below cursor unless at start/end of file
vim.opt.breakindent = true

vim.opt.completeopt = "menu,menuone,noselect,preview" -- omnicomplete options for popup menu
