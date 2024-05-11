return function()
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
                { "diagnostics", sources = { "nvim_diagnostic" } },
                "filename",
                "branch",
            },
            lualine_x = {
                "progress",
                "location",
            },
            lualine_y = { "filetype" },
            lualine_z = {
                { "fileformat", icons_enabled = false, fmt = string.upper },
            },
        },
        extensions = { "quickfix", "fugitive", "lazy", "man", "oil" },
    })
end
