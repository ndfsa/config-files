local M = {
    enabled = false,
}

local opts = require("utils").opts
vim.keymap.set("n", "<leader>sl", "<cmd>IBLToggle<CR>", opts("Set indent blank line"))

return M
