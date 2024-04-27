local M = {}

--- helper function to build silent keymaps with descriptions
-- @param desc string description of the keymap
-- @param extra table with extra options for keymap
function M.opts(desc, extra)
    local res = { silent = true }
    if desc then
        res.desc = desc
    end
    if extra then
        res = vim.tbl_extend("force", res, extra)
    end
    return res
end

local is_inside_work_tree = {}

--- find files function with fallbacks, shows git_files in a git repository, fallback to
--- find_files.
M.project_files = function(tl_builtin)
    return function()
        local cwd = vim.fn.getcwd()
        if is_inside_work_tree[cwd] == nil then
            vim.fn.system("git rev-parse --is-inside-work-tree")
            if vim.v.shell_error == 0 then
                is_inside_work_tree[cwd] = "git"
            end
        end

        if is_inside_work_tree[cwd] == "git" then
            tl_builtin.git_files({ show_untracked = true })
        else
            tl_builtin.find_files({})
        end
    end
end

return M
