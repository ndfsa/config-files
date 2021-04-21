set title
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
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
set completeopt=menuone,noselect,noinsert
set termguicolors

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
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'

"" vim 0.5 functions
" lsp and treesitter
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'hrsh7th/nvim-compe'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 40
let g:nvim_tree_auto_close = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hijack_netrw = 0
let g:startify_custom_header = [
            \ '⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠁⢇⠀⠀⠀⠀⠘⠀⢀⠈⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠀⠀⠀⠀⠀⠀⡘⠀⠀⢸⠀⠀⠀⠀⡆⠀⠀⡀⢰⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠂⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠀⠰⠀⠀⠀⠀⡇⠀⠄⠈⡆⠀⠀⠀⢇⠀⣀⣣⠀⢇⠀⠀⠀⠀⠀⠀⠄⢂⠁⢈⡐⠠⠀⠀⠐⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠂⠅⡅⠂⠀⠀⡇⠀⢸⢀⠣⠄⠒⠋⠉⠀⠀⠐⠀⠭⡙⠩⢅⠒⠠⢄⠀⠀⢁⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠀⠐⢀⠐⠭⠂⣇⠔⠋⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠤⡁⢢⠀⠈⠢⡈⠁⢀⡠⠒⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡯⣯⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠀⠐⢌⠆⢀⠜⠁⠀⠀⠀⠀⠀⠀⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⡱⡀⠀⠈⠢⡀⠉⡰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠈⠈⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀',
            \ '⠀⠀⠀⠀⠈⢠⠋⠀⠀⠀⢰⠀⠀⠀⠀⠀⣳⣄⡄⠀⠀⠀⠀⠀⠀⠀⠀⠱⣷⠀⠀⠀⠘⣆⠁⠀⠀⠀⠀⠀⠀⠀⠀⢰⠆⢀⡤⠖⠚⠒⠶⡤⡀⠀⠀⠀⢀⡤⠖⠒⠓⠒⠦⣄⠀⠀⠀⢀⣠⠖⠖⠑⠓⠶⡤⡀⠀⢹⢯⣻⡂⠀⠀⠀⠀⢀⣞⡯⡟⠀⣟⡽⡽⠀⠀⡯⡯⣗⡴⣺⢽⢽⣫⢦⣀⢴⣫⢯⣗⢯⣗⢦⠀',
            \ '⠀⠀⠀⠀⢠⠃⠂⠀⢰⡠⣺⣄⢠⠀⠀⠀⠫⢟⠣⡀⠐⢄⠀⠀⠀⠠⠀⠆⠸⣇⠀⠀⠀⠘⣦⣀⠀⠀⠀⠀⠀⠀⠀⢸⡳⠁⠀⠀⠀⠀⠀⠸⣣⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠑⣆⠀⢠⡞⠁⠀⠀⠀⠀⠀⠈⢫⣆⠀⢫⢾⣝⡄⠀⠀⠀⡼⣺⣺⠁⠀⣗⣯⣻⠀⠀⡯⣯⣳⠋⠁⠀⠈⢺⢽⣺⠝⠀⠀⠀⢹⡺⡽⡅',
            \ '⠀⠀⠀⠀⡞⢸⠀⠀⢸⠘⡗⠻⠀⢇⠀⠀⠀⠸⡀⠈⠢⣈⣳⣄⠀⠀⢆⢸⠀⠹⡄⠀⠀⠱⣾⡄⠑⡄⠀⠀⠀⠀⠀⢸⠎⠀⠀⠀⠀⠀⠀⠀⡯⠀⠀⡷⡤⡤⡤⡤⡤⡤⡤⣤⣳⠀⡼⡆⠀⠀⠀⠀⠀⠀⠀⠈⣞⡀⠈⢗⢷⢵⠀⠀⡰⡯⣗⠃⠀⠀⣗⣗⣗⠀⠀⣟⣞⣞⠀⠀⠀⠀⢸⢽⣺⠅⠀⠀⠀⢐⡯⡯⡇',
            \ '⠀⠀⠀⢠⠇⢸⠀⠀⢸⢀⠃⠀⠡⡈⡧⡀⠀⠀⢃⠐⣉⣤⣌⠙⢷⢄⠘⣼⠀⠀⣇⠀⠀⠀⠹⣿⠀⠘⣆⠀⠀⠀⠀⢸⢇⠀⠀⠀⠀⠀⠀⠀⣟⠀⠀⡯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢯⠇⠀⠀⠀⠀⠀⠀⠀⠀⡷⠁⠀⠘⡽⡽⣅⢠⢯⣻⠊⠀⠀⠀⣗⣗⣗⠀⠀⣗⣗⡽⠀⠀⠀⠀⢸⡳⣝⡇⠀⠀⠀⢐⡯⡯⡇',
            \ '⠀⠀⠀⣸⠀⢸⠀⠀⡈⣼⠤⠤⠀⠈⠪⣌⠢⢀⠸⢰⣿⡎⠿⠷⡌⠂⠈⡽⠀⡎⢸⠀⠀⠀⠀⡼⠀⠀⢸⡄⠀⠀⠀⢸⡃⠀⠀⠀⠀⠀⠀⠀⡯⠀⠀⢻⣂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣣⠀⠀⠀⠀⠀⠀⠀⣸⠝⠀⠀⠀⠸⣝⢷⢼⢽⡚⠀⠀⠀⠀⣗⣗⣗⠀⠀⣗⣗⣟⠀⠀⠀⠀⢸⣝⣗⠇⠀⠀⠀⢐⡯⡯⡇',
            \ '⠀⠀⢠⣿⠀⢸⡆⠀⡿⢡⣾⢷⣦⠀⠀⠀⠀⠀⠀⠀⢯⣤⡠⣿⡇⠀⡰⢣⠞⠀⠘⡇⠀⢀⣴⡇⠀⠀⠀⡇⠀⠀⠀⢸⡣⠀⠀⠀⠀⠀⠀⠀⣟⠀⠀⠀⠑⠗⣤⣀⣀⡠⡤⠖⠃⠀⠀⠘⠱⡤⣀⣀⣀⡤⡞⠑⠀⠀⠀⠀⠀⠹⡽⣝⡗⠀⠀⠀⠀⠀⣗⣗⣗⠀⠀⣗⢷⢽⠀⠀⠀⠀⢸⡺⡮⡇⠀⠀⠀⢐⢯⡻⡆',
            \ '⠀⠀⣼⢻⡄⠸⣧⢰⠃⠸⡟⠈⢉⡇⠀⠀⠀⠀⠀⠀⠈⠛⠓⠋⠀⠀⠋⢹⡀⠀⠀⡇⣤⣾⣿⡇⠀⠀⢰⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⣟⠀⣧⠠⣿⣿⠀⠀⢻⣷⣸⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⣿⢉⣾⣿⡇⠀⢠⠏⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⢸⡤⢘⠁⣛⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⣹⠀⠀⢿⢞⣿⣿⡇⣰⠏⠀⠸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠀⣻⣿⣇⠙⢿⡇⠀⠀⠀⠀⠀⠀⠀⠀⢸⠋⠉⡆⠀⠀⠀⠀⠀⣠⣴⣿⡇⠀⢸⣿⣿⣿⣿⣯⡆⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⢀⣇⢏⢻⡆⠀⢳⣄⡀⠀⠀⠀⠀⠀⠀⠈⠉⠉⢀⠤⠤⢠⣴⠾⡿⠟⠛⢳⠀⢸⡙⢛⡿⣻⣿⡇⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠘⡅⡎⠀⣇⠠⡚⣧⠉⠑⣒⡦⠤⠤⣤⠤⠖⠁⠁⠀⠀⠀⠁⠀⠀⠀⠀⠈⡆⢸⠟⢾⣿⣿⡿⠀⣰⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
            \ '⠀⠀⠀⠱⡄⠀⢹⠀⢱⣿⢠⡞⠁⠀⢠⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣼⠀⠈⡇⠀⣇⡴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀'
            \ ]

let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators=1
let g:undotree_SplitWidth=40

let g:user_emmet_mode='n'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall

" hide current mode, because using lightline
set noshowmode

" set some basic color settings and background override
colorscheme gruvbox
"highlight Normal guibg=none

" Remove all trailing spaces
autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e

" Useful keymaps
let mapleader = " "

noremap <leader>ss :update<cr>

" window operations
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>wc :close<cr>
nnoremap <leader>wo :only<cr>

nnoremap <leader>wmh <C-w>H
nnoremap <leader>wmj <C-w>J
nnoremap <leader>wmk <C-w>K
nnoremap <leader>wml <C-w>L

" split windows
nnoremap <leader>sh :split<cr>
nnoremap <leader>sv :vsplit<cr>

" tab operations
nnoremap <leader>tw :tabnew<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tn :tabnext<cr>
nnoremap <leader>tp :tabprevious<cr>

" move lines
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" Vim maximizer remap
nnoremap <F3> :MaximizerToggle<cr>
vnoremap <F3> :MaximizerToggle<cr>gv
inoremap <F3> <C-o>:MaximizerToggle<cr>

" nvimtree replacing netrw
nnoremap <C-n> :NvimTreeToggle<cr>

" undotree
nnoremap <F2> :UndotreeToggle<cr>

" toggle options
nnoremap <leader>on :set relativenumber!<cr>
nnoremap <leader>oh :set hlsearch!<cr>
nnoremap <leader>ow :set wrap!<cr>
nnoremap <leader>oc :ColorizerToggle<cr>

" Telescope bindings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gs <cmd>:Git<cr>
nnoremap <leader>gmj <cmd>:diffget //3<cr>
nnoremap <leader>gmf <cmd>:diffget //2<cr>

" compe mappints
inoremap <expr> <C-Space> compe#complete()
inoremap <expr> <cr> compe#confirm('<cr>')
inoremap <expr> <C-e> compe#close('<C-e>')
inoremap <expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <expr> <C-d> compe#scroll({ 'delta': -4 })

" start new terminal in current folder
if has('unix')
    nnoremap <leader>e` :!alacritty &<cr><cr>
elseif has('win32')
    nnoremap <leader>e` :!start /MIN alacritty<cr><cr>
endif

" neovim-lsp keybindings
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true              -- false will disable the whole extension
    },
}
require'compe'.setup {
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

require'colorizer'.setup()

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require('lualine').setup{options = {theme = 'gruvbox', section_separators = '', component_separators = '|'}}
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=false }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    buf_set_keymap('n', '<leader>wsa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<leader>wsr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', opts)
    buf_set_keymap('n', '<leader>wsl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap('n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap('v', '<leader>fm', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)
    end
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end
local servers = { "pyright", "rust_analyzer", "tsserver", "vimls", "clangd" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
