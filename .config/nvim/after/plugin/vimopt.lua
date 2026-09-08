-- make leader key and menu easier to reach
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- keep cursor thicc
vim.opt.guicursor = ""

-- number lines!
vim.opt.nu = true
vim.opt.relativenumber = true

-- indentation and line-wrap tweaks
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
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

-- Debugger keybindings
-- (https://youtu.be/lyNfnI-B640)
local dap = require "dap"
local ui = require "dapui"

require('dapui').setup()
require('dap-go').setup()

vim.keymap.set("n", "<leader>c", dap.continue)
vim.keymap.set("n", "<leader>n", dap.step_into)
vim.keymap.set("n", "<leader>o", dap.step_over)
vim.keymap.set("n", "<leader>r", dap.restart)
vim.keymap.set("n", "<leader>d", dap.disconnect)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)
vim.keymap.set("n", "<leader>?", function() -- check value under cursor
  require("dapui").eval(nil, {enter = true})
end)

-- Manage the Debugging UI lifespan in response to certain UI events
dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end

-- let <ESC> key be used to exit an embedded terminal
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
