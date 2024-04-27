-- disable zig autoformat
vim.g.zig_fmt_autosave = 0

local M = {}

M.csharp_ls = {}
M.dartls = {}
M.emmet_language_server = {}
M.gopls = require("lsp-servers.gopls")
M.hls = require("lsp-servers.hls")
M.html = {}
M.jsonls = {}
M.lua_ls = require("lsp-servers.lua_ls")
M.pyright = {}
M.rust_analyzer = require("lsp-servers.rust_analyzer")
M.tsserver = {}
M.zls = {}

local on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, serv in pairs(M) do
    serv.on_attach = on_attach
    serv.capabilities = capabilities
end

return M
