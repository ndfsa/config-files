local oil = {
    sections = {
        lualine_c = {
            function()
                local buff_name = vim.api.nvim_buf_get_name(0)
                local prefix = "oil://"
                local cwd = vim.fn.getcwd()
                local name = cwd:match("^.*/(.*)")

                if #buff_name < #cwd then
                    return name .. "/" .. buff_name:sub(#prefix + 2)
                else
                    return name .. "/" .. buff_name:sub(#prefix + #cwd + 2)
                end
            end,
        },
        lualine_d = { "branch" },
    },
    filetypes = { "oil" },
}
require("lualine").setup({
    options = {
        theme = "kanagawa",
        section_separators = " ",
        component_separators = " ",
        globalstatus = true,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filesize" },
        lualine_c = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
            },
            "filename",
            "branch",
        },
        lualine_x = {
            "progress",
            "location",
            function()
                return "0x%02B"
            end,
        },
        lualine_y = {
            "filetype",
        },
        lualine_z = {
            {
                "fileformat",
                icons_enabled = false,
                fmt = string.upper,
            },
        },
    },
    extensions = { "quickfix", "fugitive", "lazy", "man", oil },
})
