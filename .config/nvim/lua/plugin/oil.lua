require("oil").setup({
    columns = {
        "permissions",
        "mtime",
        "size",
        "icon",
    },
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
})
