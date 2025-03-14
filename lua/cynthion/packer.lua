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

  use 'navarasu/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use ('neovim/nvim-lspconfig')
  use ('hrsh7th/nvim-cmp')
  use ('hrsh7th/cmp-nvim-lsp')

  use ('williamboman/mason.nvim')
  use ('williamboman/mason-lspconfig.nvim')

  use ('mfussenegger/nvim-lint')

end)
