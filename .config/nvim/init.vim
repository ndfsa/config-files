set title

set exrc
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

" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'szw/vim-maximizer'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
"" vim 0.5 functions
" lsp and treesitter
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true              -- false will disable the whole extension
    },
}
EOF

let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeNaturalSort=1
let NERDTreeStatusline=-1
let NERDTreeWinSize=40
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators=1
let g:undotree_SplitWidth=40

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
" hide current mode, because using lightline
set noshowmode

" set some basic color settings and background override
colorscheme gruvbox
highlight Normal guibg=none

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if has('termguicolors')
    set termguicolors
endif

" Remove all trailing spaces
autocmd FileType c,cpp,java,rust,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

" Useful keymaps
let mapleader = " "

noremap <leader>ss :update<CR>

" window operations
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wc :close<CR>

nnoremap <leader>wmh <C-w>H
nnoremap <leader>wmj <C-w>J
nnoremap <leader>wmk <C-w>K
nnoremap <leader>wml <C-w>L

" split windows
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>

" tab operations
nnoremap <leader>tw :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

" move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Vim maximizer remap
nnoremap <F3> :MaximizerToggle<CR>
vnoremap <F3> :MaximizerToggle<CR>gv
inoremap <F3> <C-o>:MaximizerToggle<CR>

" nerdtree replacing netrw
nnoremap <silent><C-t> :NERDTreeToggle<CR>

" undotree
nnoremap <F2> :UndotreeToggle<CR>

" toggle relativenumber
nnoremap <leader>on :set relativenumber!<CR>
nnoremap <leader>oh :set hlsearch!<CR>

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" neovim-lsp keybindings
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=false }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<leader>fp", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<leader>fp", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
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

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
--local servers = { "pyright", "rust_analyzer", "clangd" }
--for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup { on_attach = on_attach }
--end
EOF
