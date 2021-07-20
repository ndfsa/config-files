require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'
		},
		prompt_prefix = "λ ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter =  require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ['COLORTERM'] = 'truecolor' },
		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
	}
}
local function hexvalue()
	return "0x%02B"
end
local function bufinfo()
	return "[%n] %t %m %r %w"
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
	},
	highlight = {
		enable = true
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
		nvim_lsp = true;
		vsnip = true;
	};
}
require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({ map_cr = true, map_complete = true })
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { noremap=true, silent=true }
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
			'<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
			'<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
			'<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
			'<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
			'<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
			'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
			'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
			'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q',
			'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fm',
			'<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>fm',
				'<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec([[
			hi LspReferenceRead cterm=bold ctermbg=red guifg=Black guibg=orange
			hi LspReferenceText cterm=bold ctermbg=red guifg=Black guibg=orange
			hi LspReferenceWrite cterm=bold ctermbg=red guifg=Black guibg=orange
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
