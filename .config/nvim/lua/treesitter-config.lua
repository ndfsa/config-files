require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"bash",
		"c",
		"clojure",
		"cmake",
		"comment",
		"css",
		"gdscript",
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
