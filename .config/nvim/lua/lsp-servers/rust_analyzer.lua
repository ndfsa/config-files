local M = {}

M.settings = {
    ["rust-analyzer"] = {
        checkOnSave = {
            command = "clippy",
        },
    },
}

return M
