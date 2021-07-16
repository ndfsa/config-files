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

"" vim 0.5 functions
" lsp and treesitter
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

" make vimwiki use markdown
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" set some basic color settings and background override
colorscheme gruvbox
"highlight Normal guibg=none

" Remove all trailing spaces
autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e

" Useful keymaps
let mapleader = " "

noremap <leader>ss :write<cr>

" window operations
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>wc :close<cr>

" split windows
nnoremap <leader>w<leader>h :split<cr>
nnoremap <leader>w<leader>v :vsplit<cr>

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
nnoremap <leader>n :NvimTreeToggle<cr>

" undotree
nnoremap <F2> :UndotreeToggle<cr>

" toggle options
nnoremap <leader>on :set relativenumber!<cr>
nnoremap <leader>oh :set hlsearch!<cr>
nnoremap <leader>ow :set wrap!<cr>:set linebreak!<cr>
nnoremap <leader>oc :ColorizerToggle<cr>

" Telescope bindings
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fz <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>

nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>

" compe mappints
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <cr> compe#confirm('<cr>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

" start new terminal in current folder
if has('unix')
    nnoremap <leader>e` :!st &<cr><cr>
elseif has('win32')
    nnoremap <leader>e` :!start /MIN alacritty<cr><cr>
endif

" neovim-lsp keybindings
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "cmake",
        "comment",
        "css",
        "gdscript",
        "html",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "python",
        "regex",
        "rust",
        "typescript"
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true              -- false will disable the whole extension
    }
}
require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        vsnip = true;
    };
}

require'colorizer'.setup()

local function hexvalue()
    return "0x%04B"
end
local function bufinfo()
    return "[%n] %t%m%r%w"
end
require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = '',
        component_separators = '│'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {bufinfo},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {hexvalue, 'progress'},
        lualine_z = {'location'}
    },
    extensions = {'nvim-tree', 'quickfix'}
}
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fm', '<cmd>lua vim.lsp.buf.formatting()<cr>', opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>fm', '<cmd>lua vim.lsp.buf.range_formatting()<cr>', opts)
    end
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi LspReferenceRead cterm=bold ctermbg=red guifg=bg guibg=LightYellow
            hi LspReferenceText cterm=bold ctermbg=red guifg=bg guibg=LightYellow
            hi LspReferenceWrite cterm=bold ctermbg=red guifg=bg guibg=LightYellow
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
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
            }
        }
end
EOF
