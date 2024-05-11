local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        lazy = false,
        config = require("plugin.kanagawa"),
    },
    {
        "stevearc/oil.nvim",
        priority = 1000,
        lazy = false,
        config = require("plugin.oil"),
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    { "nvim-lualine/lualine.nvim", config = require("plugin.lualine") },
    { "neovim/nvim-lspconfig", config = require("plugin.lspconfig") },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = require("plugin.treesitter"),
    },
    {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "honza/vim-snippets" },
        config = require("plugin.luasnip"),
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind-nvim",
        },
        config = require("plugin.cmp"),
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-neorg/neorg-telescope",
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "debugloop/telescope-undo.nvim",
            "LinArcX/telescope-env.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = require("plugin.telescope"),
    },
    { "sQVe/sort.nvim", config = true },
    { "anuvyklack/pretty-fold.nvim", config = require("plugin.pretty-fold") },
    { "tpope/vim-fugitive", init = require("plugin.vim-fugitive") },
    { "NvChad/nvim-colorizer.lua", config = require("plugin.nvim-colorizer") },
    { "monkoose/matchparen.nvim", config = true },
    { "nmac427/guess-indent.nvim", opts = { autocmd = false }, config = true },
    { "folke/which-key.nvim", config = require("plugin.which-key") },
    { "stevearc/conform.nvim", config = require("plugin.conform") },
    { "folke/twilight.nvim", opts = { context = -1, treesitter = true }, config = true },
    { "ashfinal/qfview.nvim", config = true },
    { "nvim-tree/nvim-tree.lua", config = require("plugin.nvim-tree"), lazy = true },
    { "echasnovski/mini.ai", config = true },
    { "echasnovski/mini.surround", config = true },
    { "echasnovski/mini.diff", config = true },
    { "ThePrimeagen/git-worktree.nvim", config = require("plugin.git-worktree") },
    { "Vigemus/iron.nvim", config = require("plugin.iron"), lazy = true },
})
