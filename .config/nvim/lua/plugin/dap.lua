return function()
    local dap = require("dap")
    local dapui = require("dapui")
    local opts = require("utils").opts

    dap.adapters.delve = {
        type = "server",
        host = "127.0.0.1",
        port = 38697,
    }

    dap.configurations.go = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}",
        },
    }

    dapui.setup()

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts("Toggle breakpoint"))
    vim.keymap.set("n", "<F5>", dap.continue, opts("Run / Continue execution"))
    vim.keymap.set("n", "<F6>", dap.attach, opts("Attach to process"))
    vim.keymap.set("n", "<F7>", dap.step_over, opts("Step over"))
    vim.keymap.set("n", "<F8>", dap.step_into, opts("Step into"))
    vim.keymap.set("n", "<F9>", dap.step_out, opts("Step out"))
    vim.keymap.set("n", "<leader>dc", dap.terminate, opts("Terminate"))
    vim.keymap.set("n", "<leader>dj", dap.run_to_cursor, opts("Run to cursor"))
    vim.keymap.set("n", "<leader>du", dapui.toggle, opts("Toggle DAP ui"))
end
