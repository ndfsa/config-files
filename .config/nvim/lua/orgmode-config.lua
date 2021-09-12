require('orgmode').setup({
	org_agenda_files = {'~/Documents/org/*'},
	org_default_notes_file = '~/Documents/org/notes.org',
	org_agenda_templates = {t = { description = 'Task', template = '* TODO %?\n' }},
	org_indent_mode = "noindent",
	org_todo_keywords = {'TODO', 'NEXT', '|', 'DONE'},
	mappings = {
		org = {
			org_export = '<leader>oE'
		}
	}
})
