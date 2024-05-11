return function()
    require("which-key").setup({
        triggers_nowait = {},
    })

    vim.o.timeout = true
    vim.o.timeoutlen = 300
end
