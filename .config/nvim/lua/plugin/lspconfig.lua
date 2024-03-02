local opts = require("utils").opts

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Next diagnostic"))
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts("LSP diagnostics loclist"))
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts("LSP diagnostics float"))

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local buf_opts = function(desc)
            return opts(desc, { buffer = args.buf })
        end
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buf_opts("Go to declaration"))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, buf_opts("Go to definition"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buf_opts("Go to implementation"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, buf_opts("Go to references"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, buf_opts("Show hover info"))
        vim.keymap.set(
            { "n", "i" },
            "<C-k>",
            vim.lsp.buf.signature_help,
            buf_opts("Show signature help")
        )
        vim.keymap.set(
            "n",
            "<leader>lt",
            vim.lsp.buf.type_definition,
            buf_opts("LSP type definition")
        )
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, buf_opts("LSP rename"))
        vim.keymap.set(
            { "n", "v" },
            "<leader>lc",
            vim.lsp.buf.code_action,
            buf_opts("LSP code actions")
        )
    end,
})

local servers = require("lsp-servers")
local nvim_lsp = require("lspconfig")

for name, config in pairs(servers) do
    nvim_lsp[name].setup(config)
end
