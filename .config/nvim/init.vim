syntax on
set title

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set nowrap
set incsearch
set nohlsearch

set number relativenumber
set colorcolumn=80
set signcolumn=yes
set cursorline

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden

set encoding=UTF-8
set laststatus=2
set updatetime=300
set scrolloff=8

set laststatus=2
set guicursor=

" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
"Plug 'puremourning/vimspector'

call plug#end()

let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-rust-analyzer',
    \ 'coc-sh',
    \ 'coc-pyright',
    \ 'coc-rls',
    \ 'coc-prettier',
    \ 'coc-html',
    \ 'coc-tsserver',
    \ ]
let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeNaturalSort=1
let NERDTreeStatusline=-1
let NERDTreeWinSize=35
let g:undotree_ShortIndicators=1
let g:undotree_SplitWidth=35
let g:user_emmet_mode='n'
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall

" status line
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \     'active': {
      \       'right': [ [ 'lineinfo' ],
      \                  [ 'percent' ],
      \                  [ 'fileformat', 'fileencoding', 'filetype',
      \                             'charvaluehex' ] ],
      \       'left': [ [ 'mode', 'paste' ],
      \                 [ 'gitbranch', 'cocstatus', 'readonly',
      \                             'filename', 'modified' ] ]
      \     },
      \     'component_function': {
      \       'gitbranch': 'FugitiveHead',
      \       'cocstatus': 'coc#status'
      \     },
      \     'component': {
      \       'charvaluehex': '0x%B'
      \     },
      \ }
" hide another instert type
set noshowmode

" set some basic color settings and background override
colorscheme gruvbox
highlight Normal guibg=none

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if has('termguicolors')
    set termguicolors
endif

" Layout config for fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
    \ exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Remove all trailing spaces
autocmd FileType c,cpp,java,rust,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

" Useful keymaps
let mapleader = " "
noremap <leader>ss :update<CR>

" switch buffers
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

nnoremap <leader>H <C-w>H
nnoremap <leader>J <C-w>J
nnoremap <leader>K <C-w>K
nnoremap <leader>L <C-w>L

" split windows
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>

" resize windows
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>f :resize 100<CR>

" jump tabs
nnoremap <C-h> gT
nnoremap <C-l> gt<CR>

" move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" format code
nnoremap <leader>ff :Format<CR>

" fuzzy finder
nnoremap <C-p> :Rg<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
" RG search for hidden files
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <leader><C-p> :RG<CR>

" show buffers in popup window
nnoremap <leader>b :Buffers<CR>

" nerdtree replacing netrw
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" undotree
nnoremap <silent><leader><F5> :UndotreeToggle<CR>

" toggle relativenumber
nnoremap <silent><leader>n :set relativenumber!<CR>

""" ------------- Other Keybinds -------------

" Coc keybinds
inoremap <silent><expr> <c-space> coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" use <cr> to confirm th autocomplete target
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

