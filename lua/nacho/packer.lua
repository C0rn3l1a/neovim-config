-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer (Package Manager) --
  use 'wbthomason/packer.nvim'

  -- Treesitter (Language Highlighting) --
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end,
  }

  -- Telescope (Fuzzy Finder)
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Abstract-IDE (Theme)
  use {
	  'Abstract-IDE/Abstract-cs',
	  as = 'abscs',
	  config = function()
                  vim.cmd('colorscheme abscs')
	  end
  }
  
  -- Harpoon (File Navigation)
  use('theprimeagen/harpoon')

  -- LazyGit (Git support)
  use({
	  "kdheepak/lazygit.nvim",
	  -- optional for floating window border decoration
	  requires = {
		  "nvim-lua/plenary.nvim",
	  },
  })
  
  -- LSP Zero (Language Service Provider Manager)
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
  }
}
end)
