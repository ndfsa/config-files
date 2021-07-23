local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command 'packadd packer.nvim'
end
return require('packer').startup(function()
	use 'gruvbox-community/gruvbox'
	use 'wbthomason/packer.nvim'
	use 'mbbill/undotree'
	use 'mattn/emmet-vim'
	use 'szw/vim-maximizer'
	use {
		'hoob3rt/lualine.nvim',
		config = function() require('lualine-config') end
	}
	use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use {
		'neovim/nvim-lspconfig',
		config = function () require('lsp-config') end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require('treesitter-config') end
	}
	use 'rafamadriz/friendly-snippets'
	use {
		'hrsh7th/nvim-compe',
		config = function() require('compe-config') end
	}
	use 'hrsh7th/vim-vsnip'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use {
		'nvim-telescope/telescope.nvim',
		after = {'plenary.nvim', 'popup.nvim'},
		config = function() require('telescope-config') end
	}
	use {
		'nvim-telescope/telescope-project.nvim',
		after = 'telescope.nvim'
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require('autopairs-config') end,
		after = 'nvim-compe'
	}
	use {
		'terrortylor/nvim-comment',
		config = require('nvim_comment').setup()
	}
end)
