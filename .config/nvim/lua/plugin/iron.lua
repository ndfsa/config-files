local iron = require("iron.core")

iron.setup({
    config = {
        scratch_repl = true,
        repl_definition = {
            sh = {
                command = { "bash" },
            },
        },
        repl_open_cmd = require("iron.view").right(40),
    },
    keymaps = {
        visual_send = "<F5>",
        send_file = "<F6>",
        send_line = "<F5>",
        exit = "<leader>tq",
        cr = "<leader>t<cr>",
        clear = "<space>tc",
    },
    highlight = {},
    ignore_blank_lines = true,
})
