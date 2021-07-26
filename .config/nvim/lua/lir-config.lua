local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
	show_hidden_files = true,
	devicons_enable = true,
	mappings = {
		['l']			= actions.edit,
		['<C-x>']		= actions.split,
		['<C-v>']		= actions.vsplit,
		['<C-t>']		= actions.tabedit,

		['h']			= actions.up,
		['q']			= actions.quit,

		['K']			= actions.mkdir,
		['a']			= actions.newfile,
		['r']			= actions.rename,
		['<C-]>']		= actions.cd,
		['Y']			= actions.yank_path,
		['H']			= actions.toggle_show_hidden,
		['D']			= actions.delete,

		['J'] = function()
			mark_actions.toggle_mark()
			vim.cmd('normal! j')
		end,
		['c'] = clipboard_actions.copy,
		['x'] = clipboard_actions.cut,
		['p'] = clipboard_actions.paste,
	},
	float = {
		winblend = 0,
	},
	hide_cursor = true,
}
require'nvim-web-devicons'.setup({
	override = {
		lir_folder_icon = {
		icon = "",
		color = "#8094b4",
		name = "LirFolderNode"
		},
	}
})
function _G.LirSettings()
	vim.api.nvim_buf_set_keymap('', 'x', 'J',
		':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
		{noremap = true, silent = true}
	)
	vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[	autocmd!]]
vim.cmd [[	autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
