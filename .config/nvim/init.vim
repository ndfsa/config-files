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
set guicursor=a:blinkwait5-blinkon5-blinkoff5,n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

let g:loaded_netrw = 1
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
	autocmd ColorScheme * highlight Folded guibg=none
augroup END

" Remove all trailing spaces
augroup convinient
	autocmd!
	autocmd TextYankPost * lua require'vim.highlight'.on_yank({'Substitute', 300})
	autocmd VimResized * execute "normal! \<c-w>="
augroup END

function! W() abort
	w !sudo tee % > /dev/null)
endfunction
command! W call W()

function! FoldText()
	let line = getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart
	let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
	return '+' . repeat('-', (94 - len(folded_line_num . ''))) . '(' . folded_line_num . ' L)'
endfunction
set fillchars=fold:\ 
set foldtext=FoldText()

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
nnoremap <silent><leader>wh :wincmd h<CR>
nnoremap <silent><leader>wj :wincmd j<CR>
nnoremap <silent><leader>wk :wincmd k<CR>
nnoremap <silent><leader>wl :wincmd l<CR>
nnoremap <silent><leader>w= <C-w>=
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

" toggle options
nnoremap <leader>sn :set relativenumber!<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>sw :set wrap!<CR>
nnoremap <leader>sl :set list!<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>sc :ColorizerToggle<CR>
nnoremap <leader>sr :%s/\s\+$//e<CR>
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
nnoremap <silent><leader>gs :Git<CR>
nnoremap <silent><leader>gc :Git log<CR>
nnoremap <silent><leader>gp :Git pull<CR>
nnoremap <silent><leader>gw :Git whatchanged<CR>

" compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR> compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

" open things
nnoremap <leader>op :PackerLoad nvim-tree.lua<CR>
nnoremap <silent><leader>oe :edit .<CR>
