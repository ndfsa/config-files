return function()
    require("pretty-fold").setup({
        sections = {
            left = {
                "content",
            },
        },
        fill_char = " ",
    })
    vim.opt.foldlevelstart = 99
end
