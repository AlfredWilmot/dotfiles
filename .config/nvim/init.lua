--------------------------------------------------------------------------------
-- ( https://github.com/nvim-mini/mini.nvim/tree/main#installation )
--------------------------------------------------------------------------------
-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    -- Uncomment next line to use 'stable' branch
    -- '--branch', 'stable',
    'https://github.com/nvim-mini/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
--------------------------------------------------------------------------------

-- update tree-sitter parers whenever tree-sitter is updated
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate') end
end })

-- PLUGINS --
vim.pack.add({

  -- fuzzy-finder
  { src = 'https://github.com/nvim-lua/plenary.nvim'},
  { src = 'https://github.com/nvim-telescope/telescope.nvim'},

  -- assorment of various plugin modules
  { src = 'https://github.com/nvim-mini/mini.nvim'},

  -- LSP
  { src = 'https://github.com/neovim/nvim-lspconfig'},
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range('^9')},

  -- Syntax highlighting
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter'},

})

require('mini.basics').setup()
require('mini.completion').setup()

-- to view an exhautive list of all natively avilable LSPs ':help lspconfig-all'
vim.lsp.enable({
  'lua_ls',
  'pyright',
  'bashls',
  'clangd',
  'gopls'
})
