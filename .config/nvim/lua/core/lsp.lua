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


-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- configure LSPs to use nvim-cmp as a completion engine
-- see valid names here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
require('lspconfig').clangd.setup {
  capabilities = capabilities
}
require('lspconfig').bashls.setup {
  capabilities = capabilities
}

-- https://luals.github.io/wiki/configuration/#neovim
require('lspconfig').lua_ls.setup {
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
}
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}
require('lspconfig').pyright.setup {
  capabilities = capabilities
}
require('lspconfig').ruff.setup {
  capabilities = capabilities
}
require('lspconfig').html.setup {
  capabilities = capabilities
}
require('lspconfig').gopls.setup {
  capabilities = capabilities
}
