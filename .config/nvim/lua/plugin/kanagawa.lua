require("kanagawa").setup({
    compile = true,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { bold = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = true,
    globalStatus = true,
    colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(_)
        return {}
    end,
    theme = "wave",
    background = {
        dark = "wave",
        light = "lotus",
    },
})
vim.cmd("colorscheme kanagawa")

local colors = require("kanagawa.colors").setup().palette

local markdownHighlights = {
    colors.autumnRed,
    colors.roninYellow,
    colors.autumnGreen,
    colors.crystalBlue,
    colors.oniViolet,
    colors.sakuraPink,
}

for index, value in ipairs(markdownHighlights) do
    vim.cmd(string.format("hi @text.title.%d.marker.markdown gui=bold guifg=%s", index, value))
    vim.cmd(string.format("hi @text.title.%d.markdown gui=bold guifg=%s", index, value))
end
