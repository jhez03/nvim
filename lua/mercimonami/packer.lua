-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  -- Copilot
  use('zbirenbaum/copilot.lua')

  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { { 'nvim-lua/plenary.nvim' } },
  })

  -- Tokyonight Colorscheme
  use({
    'folke/tokyonight.nvim',
    as = 'tokyonight',
    config = function()
      vim.cmd('colorscheme tokyonight')
    end,
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  -- Copilot
  use {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
          require("copilot").setup({})
      end,
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { 'williamboman/mason.nvim', run = ':MasonUpdate' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
    },
  }

  -- auto pairs
  use {"echasnovski/mini.pairs", config = function()
    require("mini.pairs").setup()
  end}

  --

  


  -- Harpoon
  use('theprimeagen/harpoon')
end)

