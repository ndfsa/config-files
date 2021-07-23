require('nvim-treesitter.configs').setup({
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
})
