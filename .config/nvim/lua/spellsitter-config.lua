require('spellsitter').setup({
	hl = 'SpellBad',
	captures = {}
})
vim.api.nvim_command('highlight SpellBad guifg=red')
