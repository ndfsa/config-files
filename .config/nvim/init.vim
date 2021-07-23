set title
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set incsearch
set nohlsearch
set nu rnu
set colorcolumn=100
set tw=99
set nowrap
set signcolumn=yes
set cursorline
set noswapfile
set nobackup
set undofile
set hidden
set encoding=UTF-8
set laststatus=2
set scrolloff=8
set undofile
set laststatus=2
set completeopt=menuone,noselect
set termguicolors
set shortmess+=c
set updatetime=500
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:~,space:·,eol:§

lua require('plugins')

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
augroup theme_colors
	autocmd!
	autocmd ColorScheme * highlight Normal guibg=none
augroup END
colorscheme gruvbox

" Remove all trailing spaces
autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e

" Useful keymaps
let mapleader = " "

nnoremap <silent><leader>fs :write<CR>
nnoremap <silent><leader>fl :let @+ = expand('%')<CR>

" window operations
nnoremap <silent><leader>wh :wincmd h<CR>
nnoremap <silent><leader>wj :wincmd j<CR>
nnoremap <silent><leader>wk :wincmd k<CR>
nnoremap <silent><leader>wl :wincmd l<CR>
nnoremap <silent><leader>wc :close<CR>

" tab operations
nnoremap <silent><leader>tw :tabnew<CR>
nnoremap <silent><leader>tc :tabclose<CR>
nnoremap <silent><leader>tn :tabnext<CR>
nnoremap <silent><leader>tp :tabprevious<CR>

" move lines
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Vim maximizer remap
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" nvimtree replacing netrw
nnoremap <silent><leader>op :NvimTreeToggle<CR>

" undotree
nnoremap <silent><F2> :UndotreeToggle<CR>

" toggle options
nnoremap <leader>sn :set relativenumber!<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>sw :set wrap!<CR>
nnoremap <leader>sl :set list!<CR>
nnoremap <leader>sc :ColorizerToggle<CR>

" Telescope bindings
nnoremap <silent><leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>fr <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <silent><leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap <silent><leader>fp <cmd>lua require('telescope').extensions.project.project{}<CR>

nnoremap <silent><leader>gb <cmd>lua require('telescope.builtin').git_branches()<CR>
nnoremap <silent><leader>gf <cmd>lua require('telescope.builtin').git_files()<CR>

" compe mappints
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })
