require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-------------------------------------------------
-- CONIGURE THE CODE-SNIPPET COMPLETION ENGINE --
-------------------------------------------------
--> https://github.com/hrsh7th/nvim-cmp

local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- snippet engine used for code-snippets
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  })
})

-------------------------------
-- CONIGURE LANGUAGE SERVERS --
-------------------------------

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = vim.lsp.config

-- configure LSPs to use nvim-cmp as a completion engine
-- see valid names here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

lspconfig('clangd', {capabilities = capabilities})
lspconfig('bashls', {capabilities = capabilities})
lspconfig('pyright', {capabilities = capabilities})
lspconfig('ruff', {capabilities = capabilities})
lspconfig('html', {capabilities = capabilities})
lspconfig('gopls', {capabilities = capabilities})

-- https://luals.github.io/wiki/configuration/#neovim
lspconfig('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'Lua 5.3',
        path = {
          '?.lua',
          '?/init.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?.lua',
          vim.fn.expand'~/.luarocks/share/lua/5.3/?/init.lua',
          '/usr/share/5.3/?.lua',
          '/usr/share/lua/5.3/?/init.lua'
        }
      },
      workspace = {
        library = {
          vim.fn.expand'~/.luarocks/share/lua/5.3',
          '/usr/share/lua/5.3',
          '${3rd}/love2d/library',
        }
      }
    }
  }
})
lspconfig('rust_analyzer', {
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      check = {
        command = "clippy";
      },
      diagnostics = {
        enable = true;
      }
    }
  }
})
lspconfig('rust-tools', {
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

----------------------------------------
-- ENABLE CONFIGURED LANGUAGE SERVERS --
----------------------------------------
local lspenable = vim.lsp.enable
lspenable('clangd')
lspenable('bashls')
lspenable('lua_ls')
lspenable('rust_analyzer')
lspenable('rust-tools')
lspenable('pyright')
lspenable('ruff')
lspenable('html')
lspenable('gopls')
