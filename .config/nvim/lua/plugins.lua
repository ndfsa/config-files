local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command 'packadd packer.nvim'
end
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
return require('packer').startup(function()
	use 'gruvbox-community/gruvbox'
	use 'wbthomason/packer.nvim'
	use 'szw/vim-maximizer'
	use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'rafamadriz/friendly-snippets'
	use 'hrsh7th/vim-vsnip'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nacro90/numb.nvim'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'plasticboy/vim-markdown'
	use 'vimwiki/vimwiki'
	use 'mattn/calendar-vim'
	use {
		'junegunn/goyo.vim',
		opt = true,
		ft = {'vimwiki'}
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	use {
		'tamago324/lir.nvim',
		config = function() require('lir-config') end
	}
	use {
		'mattn/emmet-vim',
		ft = {'html', 'css', 'javascript'},
		opt = true
	}
	use {
		'hoob3rt/lualine.nvim',
		config = function() require('lualine-config') end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function () require('lsp-config') end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		branch = '0.5-compat',
		run = 'TSUpdate',
		config = function() require('treesitter-config') end
	}
	use {
		'hrsh7th/nvim-compe',
		config = function() require('compe-config') end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'plenary.nvim', 'popup.nvim'},
		config = function() require('telescope-config') end
	}
	use {
		'nvim-telescope/telescope-project.nvim',
		requires = 'telescope.nvim'
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require('autopairs-config') end,
		after = 'nvim-compe'
	}
	use {
		'lewis6991/spellsitter.nvim',
		ft = {'markdown', 'tex', 'text', 'org'},
		opt = true,
		config = function() require('spellsitter-config') end
	}
end)
