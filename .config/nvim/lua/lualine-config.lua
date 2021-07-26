local colors = {
	black = '#282828',
	white = '#ebdbb2',
	red = '#fb4934',
	green = '#b8bb26',
	blue = '#83a598',
	yellow = '#fe8019',
	magenta	= '#b16286',
	gray = '#a89984',
	darkgray = '#3c3836',
	lightgray = '#504945',
	inactivegray = '#7c6f64',
}
local hexvalue = {
	function()
		return "0x%02B"
	end
}
local bufinfo = {
	function ()
		return "[%n] %t%4m%5r%4w"
	end,
	color = {fg = colors.white, gui = 'bold' }
}
local filesize = {
	function ()
		local function format_file_size(file)
			local size = vim.fn.getfsize(file)
			if size <= 0 then return '' end
			local sufixes = {'b', 'k', 'm', 'g'}
			local i = 1
			while size > 1024 do
				size = size / 1024
				i = i + 1
			end
			return string.format('%.1f%s', size, sufixes[i])
		end
		local file = vim.fn.expand('%:p')
		if string.len(file) == 0 then return '' end
		return format_file_size(file)
	end,
	condition = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end
}
local diag = {
	'diagnostics',
	sources = {'nvim_lsp'},
	symbols = {error = ' ', warn = ' ', info = ' '},
	color_error = colors.red,
	color_warn = colors.yellow,
	color_info = colors.cyan
}
local encoding = {
	'o:encoding',
	upper = true
}
local fileformat = {
	'fileformat',
	upper = true
}
local lsp_name = {
	function()
		local msg = ''
		local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then return msg end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = ' LSP:',
	color = {fg = colors.white, gui = 'bold'}
}
local separator = {
	function() return '%=' end
}
require('lualine').setup({
	options = {
		theme = 'gruvbox',
		section_separators = '  ',
		component_separators = '  ',
		disabled_filetypes = {'undotree', 'diff', 'NvimTree', 'qf'},
		icons_enabled = false
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {},
		lualine_c = {filesize, bufinfo, 'location', 'progress', diag, separator, lsp_name},
		lualine_x = {encoding, fileformat, hexvalue, 'filetype', 'branch'},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filetype', bufinfo},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
})
