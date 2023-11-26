local M = {}

local module_loc = "lsp-servers."
M.astro = {}
M.ccls = {}
M.dartls = {}
M.emmet_language_server = {}
M.gopls = {}
M.html = {}
M.jsonls = {}
M.lua_ls = require(module_loc .. "lua")
M.ocamllsp = {}
M.pyright = {}
M.rust_analyzer = require(module_loc .. "rust")
M.rust_analyzer = {}
M.svelte = {}
M.tsserver = {}

local on_attach = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, serv in pairs(M) do
    serv.on_attach = on_attach
    serv.capabilities = capabilities
end

return M
