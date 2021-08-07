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
set guifont=FiraCode:h14
set foldmethod=indent
set nofoldenable
set fileformats=unix,dos,mac
set noshowmode
set autowrite
set mouse=a
set pumheight=15
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkon30

let g:loaded_netrwPlugin = 1
lua require('plugins')

let g:user_emmet_mode = 'n'
let g:user_emmet_install_global = 0

let g:mundo_width = 40
let g:mundo_preview_height = 20
let g:mundo_preview_bottom = 1
let g:mundo_right = 1

if (has('termguicolors') && $TERM =~ '256color')
	set termguicolors
elseif ($TERM =~ 'linux' || $TERM =~ 'screen')
	let g:gruvbox_termcolors=256
endif

colorscheme gruvbox
augroup colorscheme_custom
	autocmd!
	autocmd ColorScheme * highlight Normal guibg=none
augroup END

" Remove all trailing spaces
augroup convinient
	autocmd!
	autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e
	autocmd TextYankPost * lua require'vim.highlight'.on_yank({'Substitute', 300})
	autocmd VimResized * execute "normal! \<c-w>="
augroup END

function! Doaswrite() abort
	if (executable('doas'))
		w !doas tee % > /dev/null
	else
		w !sudo tee % > /dev/null)
	endif
endfunction
command! Doasw call Doaswrite()

" Useful keymaps
let mapleader = ' '
nnoremap Y y$

" center search
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Jumplist when jump > 10
nnoremap <expr> k (v:count > 10 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 10 ? "m'" . v:count : "") . 'j'

" kusa
nnoremap <silent><leader>ww :update<CR>

" insert time
nnoremap <silent><leader>gt :put =strftime('%c')<CR>

" window operations
nnoremap <silent><leader>wh <cmd>wincmd h<CR>
nnoremap <silent><leader>wj <cmd>wincmd j<CR>
nnoremap <silent><leader>wk <cmd>wincmd k<CR>
nnoremap <silent><leader>wl <cmd>wincmd l<CR>
nnoremap <silent><leader>w= <C-w>=<CR>
nnoremap <silent><leader>wc <cmd>close<CR>

" buffer operations
nnoremap <silent> <leader>bp <cmd>bprevious<CR>
nnoremap <silent> <leader>bn <cmd>bnext<CR>
nnoremap <silent> <leader>bf <cmd>bfirst<CR>
nnoremap <silent> <leader>bl <cmd>blast<CR>
nnoremap <silent> <leader>bd <cmd>bd<CR>

" move lines
vnoremap <silent><A-j> <cmd>m '>+1<CR>gv=gv
vnoremap <silent><A-k> <cmd>m '<-2<CR>gv=gv

" Vim maximizer remap
nnoremap <silent><F3> <cmd>MaximizerToggle<CR>
vnoremap <silent><F3> <cmd>MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o><cmd>MaximizerToggle<CR>

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

" open things
nnoremap <leader>op :PackerLoad nvim-tree.lua<CR>
nnoremap <silent><leader>oe <cmd>edit .<CR>
