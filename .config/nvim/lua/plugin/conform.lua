local opts = require("utils").opts
local conform = require("conform")
local FMT_ON_SAVE = true

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
    },
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
    conform.format({
        lsp_fallback = FMT_ON_SAVE,
    })
end, opts("Format buffer"))
