vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.encoding = "UTF-8"
vim.opt.scrolloff = 5
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append({ c = true })
vim.opt.updatetime = 500
vim.opt.guifont = "JetBrains Mono:h15"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.showmode = false
vim.opt.autowrite = true
vim.opt.mouse = "a"
vim.opt.pumheight = 30
vim.opt.fillchars:append({ fold = " ", eob = " " })
vim.opt.conceallevel = 2
vim.opt.termguicolors = true
vim.opt.listchars = {
    tab = "»-",
    extends = "⟩",
    precedes = "⟨",
    space = "·",
    nbsp = "␣",
    eol = "↲",
}

vim.opt.background = "dark"
vim.opt.spelloptions = "noplainbuffer,camel"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- EXPERIMENTAL FEATURES
-- vim.opt.cmdheight = 0
-- vim.opt.diffopt = 'linematch:60'

local default_plugins = {
    "2html_plugin",
    "bugreport",
    "compiler",
    "ftplugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "matchit",
    "matchparen",
    "netrw",
    "netrwFileHandlers",
    "netrwPlugin",
    "netrwSettings",
    "optwin",
    "rplugin",
    "rrhelper",
    "spellfile_plugin",
    "synmenu",
    "syntax",
    "tar",
    "tarPlugin",
    "tutor",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(default_plugins) do
    vim.g["loaded_" .. plugin] = 1
end

local default_providers = {
    "node",
    "perl",
    "python3",
    "ruby",
}

for _, provider in ipairs(default_providers) do
    vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.sql_type_default = "postgresql"

vim.g.mapleader = " "

local opts = require("utils").opts

vim.keymap.set("n", "n", "nzz", opts())
vim.keymap.set("n", "N", "Nzz", opts())

vim.keymap.set("n", "<C-u>", "<C-u>zz", opts())
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts())

vim.keymap.set("n", "k", [[v:count == 0 ? 'gk' : 'k']], opts(nil, { expr = true }))
vim.keymap.set("n", "j", [[v:count == 0 ? 'gj' : 'j']], opts(nil, { expr = true }))

vim.keymap.set("v", ">", ">gv", opts())
vim.keymap.set("v", "<", "<gv", opts())

vim.keymap.set("i", ",", ",<C-g>u", opts())
vim.keymap.set("i", ".", ".<C-g>u", opts())
vim.keymap.set("i", "!", "!<C-g>u", opts())
vim.keymap.set("i", "?", "?<C-g>u", opts())
vim.keymap.set("i", "-", "-<C-g>u", opts())
vim.keymap.set("i", "_", "_<C-g>u", opts())

vim.keymap.set("n", "<A-j>", ":m .+1<CR>", opts())
vim.keymap.set("n", "<A-k>", ":m .-2<CR>", opts())
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts())
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts())
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts())
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts())

vim.keymap.set("n", "]b", "<cmd>bn<CR>", opts("Buffer next"))
vim.keymap.set("n", "[b", "<cmd>bp<CR>", opts("Buffer previous"))
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", opts("Quickfix next"))
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>", opts("Quickfix previous"))

vim.keymap.set("i", "<C-h>", "<C-w>", opts())
vim.keymap.set("n", "<C-CR>", "i<cr><esc>", opts())

vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", opts("Buffer delete"))

vim.keymap.set("n", "<leader>sn", "<cmd>set relativenumber!<CR>", opts("Set relative numbers"))
vim.keymap.set("n", "<leader>sw", "<cmd>set wrap!<CR>", opts("Set wrap"))
vim.keymap.set("n", "<leader>ss", "<cmd>set spell!<CR>", opts("Set spell"))
vim.keymap.set("n", "<leader>sh", "<cmd>set list!<CR>", opts("Set listchars"))
vim.keymap.set("n", "<leader>sb", "<cmd>set linebreak!<CR>", opts("Set line break"))

vim.keymap.set("n", "<leader>fs", "<cmd>update<CR>", opts("File save"))
vim.keymap.set("n", "<leader>fy", '<cmd>let @+=expand("%:p")<CR>', opts("File copy path"))

vim.keymap.set("n", "<leader>oe", "<cmd>Oil %:p:h<CR>", opts("Open File Explorer"))

if vim.opt.diff:get() then
    vim.opt.winbar = "%=%f%="
    vim.keymap.set("n", "<leader>1", "<cmd>diffget LO<CR>", opts("Diff get local"))
    vim.keymap.set("n", "<leader>2", "<cmd>diffget BA<CR>", opts("Diff get base"))
    vim.keymap.set("n", "<leader>3", "<cmd>diffget RE<CR>", opts("Diff get remote"))
end
