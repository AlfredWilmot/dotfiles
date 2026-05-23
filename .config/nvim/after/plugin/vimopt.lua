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
vim.opt.wrap = false

-- Disable backup files and opt for undotree with long history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- More helpful highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- colorscheme
vim.cmd 'colorscheme retrobox'

-- keeps some space below the cursor line
vim.opt.scrolloff = 8

-- keep lines short and sweet
vim.opt.colorcolumn = "80"

-- misc
vim.opt.updatetime = 50

-- highlight trailing whitespace
vim.cmd [[highlight TrailingWS ctermbg=red guibg=red | match TrailingWS /\s\+$/]]

-- format json
vim.keymap.set("n", "<leader>fj", ":%!jq .<CR>", opts)

-- ensure gdb debugger is available
vim.cmd('packadd! termdebug')
vim.g.termdebug_wide = 1
vim.g.termdebugger = "rust-gdb"

-- navigate between the various debugging panes
vim.keymap.set("n", ",S", ":Source<CR>", opts)
vim.keymap.set("n", ",G", ":Gdb<CR>i", opts)
vim.keymap.set("n", ",V", ":Var<CR>", opts)
vim.keymap.set("n", ",A", ":Asm<CR>", opts)

-- interact with the debugging session
vim.keymap.set("n", ",w", ":call TermDebugSendCommand('where')<CR>")
vim.keymap.set("n", ",e", ":Evaluate<CR>", opts)
vim.keymap.set("n", ",b", ":Break<CR>", opts)
vim.keymap.set("n", ",c", ":Continue<CR>", opts)
vim.keymap.set("n", ",s", ":Step<CR>", opts)
vim.keymap.set("n", ",n", ":Next<CR>", opts)

-- let <ESC> key be used to exit an embedded terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
