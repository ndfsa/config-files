local opts = require("utils").opts
local conform = require("conform")

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

conform.formatters.cabalfmt = {
    inherit = false,
    command = "cabal-fmt",
    stdin = false,
    args = { "--inplace", "$FILENAME" },
}

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        cabal = { "cabalfmt" },
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
    },
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
    conform.format({
        lsp_fallback = true,
    })
end, opts("Format buffer"))
