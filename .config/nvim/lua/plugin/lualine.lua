local oil = {
    sections = {
        lualine_c = {
            require("oil").get_current_dir,
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
            function()
                return "%t%4m%5r%4w"
            end,
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
