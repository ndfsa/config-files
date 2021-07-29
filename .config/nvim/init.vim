set title
set tabstop=4
set shiftwidth=4
set autoindent
set smartcase
set incsearch
set nohlsearch
set nu rnu
set colorcolumn=100
set textwidth=99
set nowrap
set signcolumn=yes
set cursorline
set noswapfile
set undofile
set hidden
set encoding=UTF-8
set laststatus=2
set scrolloff=8
set undofile
set laststatus=2
set completeopt=menuone,noselect
set shortmess+=c
set updatetime=500
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:~,space:·,eol:§
set guifont=FiraCode\ Nerd\ Font\ Mono:h14
set foldmethod=indent
set nofoldenable
set fileformats=unix,dos,mac
set noshowmode
set autowrite
set mouse=a
set pumheight=15

let g:loaded_netrwPlugin = 1
lua require('plugins')

let g:user_emmet_mode = 'n'
let g:user_emmet_install_global = 0

let g:mundo_width = 40
let g:mundo_preview_height = 20
let g:mundo_preview_bottom = 1
let g:mundo_right = 1

if (has('termguicolors') && $TERM =~ '256color$')
	set termguicolors
elseif ($TERM =~ '^linux')
	let g:gruvbox_termcolors=16
endif
colorscheme gruvbox

" Remove all trailing spaces
augroup convinient
	autocmd!
	autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e
	autocmd TextYankPost * lua require'vim.highlight'.on_yank({'Substitute', 300})
	autocmd VimResized * execute "normal! \<c-w>="
augroup END

" Useful keymaps
let mapleader = " "

" kusa
nnoremap <silent><leader>ww :update<CR>

" window operations
nnoremap <silent><leader>wh :wincmd h<CR>
nnoremap <silent><leader>wj :wincmd j<CR>
nnoremap <silent><leader>wk :wincmd k<CR>
nnoremap <silent><leader>wl :wincmd l<CR>
nnoremap <silent><leader>w= <C-w>=<CR>
nnoremap <silent><leader>wc :close<CR>

" buffer operations
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bf :bfirst<CR>
nnoremap <silent> <leader>bl :blast<CR>
nnoremap <silent> <leader>bd :bd<CR>

" move lines
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Vim maximizer remap
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

" mundo
nnoremap <silent><F2> :MundoToggle<CR>

" toggle options
nnoremap <leader>sn :set relativenumber!<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>sw :set wrap!<CR>
nnoremap <leader>sl :set list!<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>sc :ColorizerToggle<CR>

" Telescope
nnoremap <silent><leader>ff :Telescope find_files<CR>
nnoremap <silent><leader>fg :Telescope live_grep<CR>
nnoremap <silent><leader>fb :Telescope buffers<CR>
nnoremap <silent><leader>fr :Telescope registers<CR>
nnoremap <silent><leader>fm :Telescope marks<CR>
nnoremap <silent><leader>fq :Telescope quickfix<CR>
nnoremap <silent><leader>fz :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent><leader>fs :Telescope spell_suggest<CR>
nnoremap <silent><leader>fp <cmd>lua require('telescope').extensions.project.project{}<CR>

nnoremap <silent><leader>gb :Telescope git_branches<CR>

" Git fugitive
nnoremap <silent><leader>gs <cmd>:Git<CR>
nnoremap <silent><leader>gc <cmd>:Git log<CR>
nnoremap <silent><leader>gp <cmd>:Git pull<CR>
nnoremap <silent><leader>gw <cmd>:Git whatchanged<CR>

" compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

" file stuff
nnoremap <leader>op :PackerLoad nvim-tree.lua<CR>
nnoremap <leader>oe :edit .<CR>
