local M = {}

M.settings = {
    Lua = {
        runtime = {
            version = "LuaJIT",
        },
        workspace = {
            checkThirdParty = false,
            library = {
                vim.env.VIMRUNTIME,
            },
        },
        telemetry = {
            enable = false,
        },
    },
}

return M
