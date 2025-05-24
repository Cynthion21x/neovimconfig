-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
          "kdheepak/lazygit.nvim",
          -- optional for floating window border decoration
          requires = {
                  "nvim-lua/plenary.nvim",
          },
  })

  use({
          "neanias/everforest-nvim",
          -- Optional; default configuration will be used if setup isn't called.
          config = function()
                  require("everforest").setup()
          end,
  })

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use ('neovim/nvim-lspconfig')
  use ('hrsh7th/nvim-cmp')
  use ('hrsh7th/cmp-nvim-lsp')


  use {
          "williamboman/mason.nvim",
          config = function ()
                  require("mason").setup()
          end,
  }

  use {
          "williamboman/mason-lspconfig.nvim",
          after = { "mason.nvim", "nvim-lspconfig" },
          config = function ()
                  require("mason-lspconfig").setup({
                          automatic_enable = false,
                  })
          end
  }


  use ('mfussenegger/nvim-lint')

  use ('jose-elias-alvarez/null-ls.nvim')
  use ('jay-babu/mason-null-ls.nvim')

end)
