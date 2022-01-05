local telescope = require('telescope')
telescope.setup{
	defaults = {
		sorting_strategy = "ascending",

		layout_config = {
			prompt_position = "top"
		},
		file_ignore_patterns = {'.git/', 'node_modules/'},
	},
	extensions = {
		fzf = {
			fuzzy = true
		},
		file_browser = {
			hidden = true,
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--hidden',
				'--glob',
				'!.git/',
			},
		}
	}
}
telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('media_files')
telescope.load_extension('file_browser')
