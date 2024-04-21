local opts = require("utils").opts
local tl_extensions = require("telescope").extensions

require("git-worktree").setup()

vim.keymap.set(
    "n",
    "<leader>gw",
    tl_extensions.git_worktree.git_worktrees,
    opts("Git show worktrees")
)
vim.keymap.set(
    "n",
    "<leader>ga",
    tl_extensions.git_worktree.create_git_worktree,
    opts("Git create worktree")
)
