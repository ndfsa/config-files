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
        build = ":KanagawaCompile",
        config = function()
            require("plugin.kanagawa")
        end,
        priority = 0,
    },
    {
        "stevearc/oil.nvim",
        config = function()
            require("plugin.oil")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugin.lualine")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugin.lspconfig")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("plugin.treesitter")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugin.luasnip")
        end,
        build = "make install_jsregexp",
        dependencies = { "honza/vim-snippets" },
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
        config = function()
            require("plugin.cmp")
        end,
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
        config = function()
            require("plugin.telescope")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    {
        "sQVe/sort.nvim",
        config = true,
    },
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("plugin.pretty-fold")
        end,
    },
    {
        "tpope/vim-fugitive",
        init = function()
            require("plugin.vim-fugitive")
        end,
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("plugin.nvim-colorizer")
        end,
    },
    {
        "monkoose/matchparen.nvim",
        config = true,
    },
    {
        "nmac427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({ autocmd = false })
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("plugin.which-key")
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("plugin.conform")
        end,
    },
    {
        "folke/twilight.nvim",
        config = function()
            require("plugin.twilight")
        end,
    },
    {
        "ashfinal/qfview.nvim",
        config = true,
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("plugin.nvim-tree")
        end,
        cmd = "EnableNvimTree",
    },
    { "echasnovski/mini.ai", config = true },
    { "echasnovski/mini.surround", config = true },
    {
        "ThePrimeagen/git-worktree.nvim",
        config = function()
            require("plugin.git-worktree")
        end,
    },
})
