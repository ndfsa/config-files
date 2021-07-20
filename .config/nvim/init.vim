set title
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set incsearch
set nohlsearch
set nu rnu
set colorcolumn=100
set signcolumn=yes
set cursorline
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden
set encoding=UTF-8
set laststatus=2
set scrolloff=8
set laststatus=2
set completeopt=menuone,noselect
set termguicolors
set shortmess+=c
set updatetime=500


" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'szw/vim-maximizer'
Plug 'hoob3rt/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" vim 0.5 functions
" lsp and treesitter
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'windwp/nvim-autopairs'

call plug#end()

let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 40
let g:nvim_tree_auto_close = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
let g:nvim_tree_auto_open = 0
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators=1
let g:undotree_SplitWidth=40
let g:nvim_tree_update_cwd = 1
let g:nvim_tree_show_icons = {
	\ 'folders': 1,
	\ 'files': 1,
	\ }

let g:user_emmet_mode='n'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall

" hide current mode, because using lightline
set noshowmode

" set some basic color settings and background override
colorscheme gruvbox
if &term == 'nvim'
	set guifont=FiraCode\ Nerd\ Font\ Mono:h13
else
	highlight Normal guibg=none
endif

" Remove all trailing spaces
autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e

" Useful keymaps
let mapleader = " "

noremap <leader>fs :write<CR>
noremap <leader>fl :let @+ = expand('%')<CR>

" window operations
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wc :close<CR>

" tab operations
nnoremap <leader>tw :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" move lines
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Vim maximizer remap
nnoremap <F3> :MaximizerToggle<CR>
vnoremap <F3> :MaximizerToggle<CR>gv
inoremap <F3> <C-o>:MaximizerToggle<CR>

" nvimtree replacing netrw
nnoremap <leader>op :NvimTreeToggle<CR>

" undotree
nnoremap <F2> :UndotreeToggle<CR>

" toggle options
nnoremap <leader>sn :set relativenumber!<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>sw :set wrap!<CR>:set linebreak!<CR>
nnoremap <leader>sc :ColorizerToggle<CR>

" Telescope bindings
nnoremap <leader>pf <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>pr <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ph <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>pz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <leader>pp <cmd>lua require('telescope').extensions.project.project{}<CR>

nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<CR>

" compe mappints
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

lua require('config')
