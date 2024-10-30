-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	--> Packer can manage itself
	use 'wbthomason/packer.nvim'

  --> Package manager
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

	--> Fuzzy-finder utility
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    --> https://github.com/iamcco/markdown-preview.nvim
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

	--> Nice syntax highlighting
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    --> colorscheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
	--> git-esque undo branching/history
	use('mbbill/undotree')

	--> language server for autocompletion
  use 'neovim/nvim-lspconfig'

  -- rust tools
  use 'simrat39/rust-tools.nvim'
      -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

end)
