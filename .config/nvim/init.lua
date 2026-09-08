--------------------------------------------------------------------------------
--- NOTE: run the following cmd to update packages ':lua vim.pack.update()'
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
    '--branch', 'stable',
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

-- ########################################################################## --
-- ## PLUGINS
-- ########################################################################## --
vim.pack.add({

  -- fuzzy-finder
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },

  -- assortment of various plugin modules
  { src = 'https://github.com/nvim-mini/mini.nvim' },

  -- LSP
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },

  -- Syntax highlighting
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },

  -- Rust Dev Tooling
  { src = 'https://github.com/mrcjkb/rustaceanvim', version = vim.version.range('^9') },

  -- Go Dev Tooling (:GoInstallDeps)
  { src = "https://github.com/olexsmir/gopher.nvim" },

  -- DAP
  { src = "https://github.com/mfussenegger/nvim-dap"},
  { src = "https://github.com/leoluz/nvim-dap-go"},
  { src = "https://github.com/nvim-neotest/nvim-nio"},
  { src = "https://github.com/rcarriga/nvim-dap-ui"},

})
require('mini.basics').setup()
require('mini.completion').setup({
  -- DOCS: https://github.com/nvim-mini/mini.nvim/blob/main/readmes/mini-completion.md
  mappings = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>'
  },
  { src = 'https://github.com/nvim-mini/mini.completion', version = 'stable' },
})

-- to view an exhautive list of all natively avilable LSPs ':help lspconfig-all'
require('mason').setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ty",
    "gopls",
    "bashls",
    "clangd",
    "jinja_lsp",
  },
})

-- registering filetypes to activate relevant LSPs
vim.filetype.add {
  extension = {
    jinja = 'jinja', jinja2 = 'jinja', j2 = 'jinja',
  },
}

-- https://go.dev/gopls/editor/vim#neovim
vim.lsp.config.gopls = {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}
require('gopher').setup()

-- auto-format go files on save (available by default when using gopls)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
    })
  end,
})
