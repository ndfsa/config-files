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
            require("plugin-config.kanagawa")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugin-config.indent-blankline")
        end,
    },
    {
        "stevearc/oil.nvim",
        config = function()
            require("plugin-config.oil")
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugin-config.lualine")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugin-config.lspconfig")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("plugin-config.treesitter")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugin-config.luasnip")
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
            require("plugin-config.cmp")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-symbols.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "LinArcX/telescope-env.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            require("plugin-config.telescope")
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
            require("plugin-config.pretty-fold")
        end,
    },
    {
        "tpope/vim-fugitive",
        init = function()
            require("plugin-config.vim-fugitive")
        end,
    },
    {
        "kylechui/nvim-surround",
        config = true,
    },
    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("plugin-config.nvim-colorizer")
        end,
    },
    {
        "monkoose/matchparen.nvim",
        config = true,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugin-config.null-ls")
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nmac427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({ autocmd = false })
        end,
    },
    {
        "NTBBloodbath/rest.nvim",
        config = function()
            require("plugin-config.rest")
        end,
        ft = { "http" },
    },
    {
        "mbbill/undotree",
        init = function()
            require("plugin-config.undotree")
        end,
    },
    {
        "folke/which-key.nvim",
        config = true,
    },
    {
        "folke/twilight.nvim",
        config = function()
            require("plugin-config.twilight")
        end,
    },
    {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup()
        end,
    },
})
