-- disable zig autoformat
vim.g.zig_fmt_autosave = 0

local M = {}

local mod_dir = "lsp-servers."
M.csharp_ls = {}
M.dartls = {}
M.emmet_language_server = {}
M.gopls = {}
M.hls = require(mod_dir .. "hls")
M.html = {}
M.jsonls = {}
M.lua_ls = require(mod_dir .. "lua")
M.pyright = {}
M.rust_analyzer = require(mod_dir .. "rust")
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
