local vimgrep_arguments = {
    "rg",
    "--color=never",
    "--hidden",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
    "--trim",
}

if vim.uv.fs_stat(".gitignore") then
    table.insert(vimgrep_arguments, "--ignore-file")
    table.insert(vimgrep_arguments, ".gitignore")
end

local telescope = require("telescope")
local ignore_patterns = { "%.git[/\\]" }

telescope.setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
            mirror = true,
        },
        vimgrep_arguments = vimgrep_arguments,
        preview = true,
        file_ignore_patterns = ignore_patterns,
    },
})
telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("env")
telescope.load_extension("ui-select")

local tl_ext = telescope.extensions
local tl_builtin = require("telescope.builtin")
local opts = require("utils").opts

vim.keymap.set(
    "n",
    "<leader><space>",
    require("utils").project_files(tl_builtin),
    opts("Find file")
)
vim.keymap.set("n", "<leader>bz", tl_builtin.current_buffer_fuzzy_find, opts("Buffer fuzzy find"))
vim.keymap.set("n", "<leader>fg", tl_builtin.live_grep, opts("Find grep"))
vim.keymap.set("n", "<leader>fr", tl_builtin.registers, opts("Find registers"))
vim.keymap.set("n", "<leader>fb", tl_builtin.buffers, opts("Find buffers"))
vim.keymap.set("n", "<leader>fp", function()
    tl_ext.project.project({})
end, opts("Find projects"))
vim.keymap.set("n", "<leader>fE", tl_ext.env.env, opts("Find environment variables"))
