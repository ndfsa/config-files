local neogit = require("neogit")

neogit.setup({
    graph_style = "unicode",
})

local opts = require("utils").opts

vim.keymap.set("n", "<leader>gs", neogit.open, opts("Git status (Neogit)"))
