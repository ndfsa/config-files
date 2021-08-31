require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"comment",
		"css",
		"gdscript",
		"haskell",
		"html",
		"java",
		"json",
		"latex",
		"lua",
		"python",
		"regex",
		"toml",
		"tsx",
		"typescript"
	},
	highlight = {
		enable = true
	}
})
