return function()
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = true,
        },
        hijack_directories = {
            enable = false,
            auto_open = false,
        },
        hijack_netrw = true,
    })

    local opts = require("utils").opts
    vim.keymap.set("n", "<leader>ot", "<cmd>NvimTreeToggle<cr>", opts("Open tree"))
end
