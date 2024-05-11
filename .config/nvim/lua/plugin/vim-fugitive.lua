return function()
    local opts = require("utils").opts

    vim.keymap.set("n", "<leader>gB", "<cmd>vertical G blame<CR>", opts("Git blame"))
    vim.keymap.set("n", "<leader>gs", "<cmd>tab G<CR>", opts("Git status"))
    vim.keymap.set(
        "n",
        "<leader>gl",
        "<cmd>tab G log --oneline --graph --all<CR>",
        opts("Git commits")
    )
    vim.keymap.set("n", "<leader>gL", "<cmd>tab G log --graph<CR>", opts("Git full log"))
    vim.keymap.set("n", "<leader>gh", "<cmd>tab split | 0Gclog<CR>", opts("Git file history"))
    vim.keymap.set("n", "<leader>gc", "<cmd>G difftool<CR>", opts("Git project diff tool"))
    vim.keymap.set("n", "<leader>gR", "<cmd>G restore %<CR>", opts("Git restore current file"))
end
