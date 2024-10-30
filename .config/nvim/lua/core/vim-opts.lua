-- make leader key and menu easier to reach
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- keep cursor thicc
vim.opt.guicursor = ""

-- number lines!
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation and line-wrap tweaks
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Disable backup files and opt for undotree with long history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- More helpful highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- easier on the eyes
vim.opt.termguicolors = true

-- keeps some space below the cursor line
vim.opt.scrolloff = 8

-- keep lines short and sweet
vim.opt.colorcolumn = "80"

-- misc
vim.opt.updatetime = 50

vim.cmd.colorscheme = "onedark"

-- highlight trailing whitespace
vim.cmd [[highlight TrailingWS ctermbg=red guibg=red | match TrailingWS /\s\+$/]]

-- format json
vim.keymap.set("n", "<leader>fj", ":%!jq .<CR>", opts)
