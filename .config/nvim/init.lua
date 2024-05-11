require("core")

local status, err = pcall(require, "plugin-config")
if not status then
    print(err)
end

local AUG = vim.api.nvim_create_augroup("convenient", {
    clear = true,
})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = AUG,
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 300,
        })
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    group = AUG,
    callback = function()
        vim.cmd("clearjumps")
    end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = AUG,
    command = "normal zx",
})

vim.api.nvim_create_user_command("Redir", function(ctx)
    local lines =
        vim.split(vim.api.nvim_exec2(ctx.args, { output = true }).output, "\n", { plain = true })
    vim.cmd("new")
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.opt_local.modified = false
end, { nargs = "+", complete = "command" })
