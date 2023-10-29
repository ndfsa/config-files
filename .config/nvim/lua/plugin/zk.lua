local opts = require("utils").opts

local zk = require("zk")
local zkcmd = require("zk.commands")

zk.setup()

vim.keymap.set("n", "<leader>Jd", function()
    zkcmd.get("ZkNew")({ dir = "journal/daily" })
end, opts("Journal daily"))

vim.keymap.set("n", "<leader>fj", function()
    zkcmd.get("ZkNotes")({ select = { "absPath", "title" }, tags = { "daily" } })
end, opts("Find daily journal"))

vim.keymap.set("n", "<leader>fn", function()
    zkcmd.get("ZkNotes")({ select = { "absPath", "title" }, tags = { "topic" } })
end, opts("Find topic notes"))
