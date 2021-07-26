vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_show_icons = {folders = 1, files = 1}

vim.api.nvim_set_keymap(
	'n', '<leader>op', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true }
)

print("nvim-tree loaded.")
