local wezterm = require("wezterm")
local act = wezterm.action

local function rule(intensity, weight, italic)
    return {
        italic = italic,
        intensity = intensity,
        font = wezterm.font_with_fallback({
            {
                family = "JetBrains Mono",
                italic = italic,
                weight = weight,
            },
            "Symbols Nerd Font",
            "Symbola",
        }),
    }
end
local config = {
    font_rules = {
        rule("Half", "ExtraLight", false),
        rule("Normal", "Regular", false),
        rule("Bold", "ExtraBold", false),
        rule("Half", "ExtraLight", true),
        rule("Normal", "Regular", true),
        rule("Bold", "ExtraBold", true),
    },
    hide_tab_bar_if_only_one_tab = true,
    audible_bell = "Disabled",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
    use_fancy_tab_bar = false,
    initial_rows = 38,
    initial_cols = 120,
    window_padding = {
        left = 2,
        right = 2,
        top = 0,
        bottom = 0,
    },
    font_size = 14,
    enable_tab_bar = true,
    bold_brightens_ansi_colors = true,
    adjust_window_size_when_changing_font_size = false,
    force_reverse_video_cursor = true,
    tab_bar_at_bottom = true,
    colors = {
        foreground = "#dcd7ba",
        background = "#1f1f28",
        cursor_bg = "#c8c093",
        cursor_fg = "#c8c093",
        cursor_border = "#c8c093",
        selection_fg = "#c8c093",
        selection_bg = "#2d4f67",
        scrollbar_thumb = "#16161d",
        split = "#16161d",
        ansi = {
            "#090618",
            "#c34043",
            "#76946a",
            "#c0a36e",
            "#7e9cd8",
            "#957fb8",
            "#6a9589",
            "#c8c093",
        },
        brights = {
            "#727169",
            "#e82424",
            "#98bb6c",
            "#e6c384",
            "#7fb4ca",
            "#938aa9",
            "#7aa89f",
            "#dcd7ba",
        },
        indexed = { [16] = "#ffa066", [17] = "#ff5d62" },
        tab_bar = {
            background = "#181820",
            active_tab = {
                bg_color = "#7e9cd8",
                fg_color = "#1f1f28",
            },
            inactive_tab = {
                bg_color = "#252535",
                fg_color = "#7e9cd8",
            },
            inactive_tab_hover = {
                bg_color = "#957fb8",
                fg_color = "#1f1f28",
            },
            new_tab = {
                bg_color = "#1f1f28",
                fg_color = "#363646",
            },
            new_tab_hover = {
                bg_color = "#957fb8",
                fg_color = "#1f1f28",
            },
        },
    },
    mouse_bindings = {
        {
            event = { Up = { streak = 1, button = "Left" } },
            mods = "CTRL",
            action = act.OpenLinkAtMouseCursor,
        },
        {
            event = { Up = { streak = 1, button = "Right" } },
            action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
        },
    },
}
config.keys = {
    {
        key = "t",
        mods = "ALT",
        action = act.SpawnTab("CurrentPaneDomain"),
    },
    { key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
    { key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
    { key = "[", mods = "ALT", action = act.ActivateTabRelative(-1) },
    { key = "]", mods = "ALT", action = act.ActivateTabRelative(1) },
}
for i = 1, 9 do
    table.insert(config.keys, {
        key = tostring(i),
        mods = "ALT",
        action = act.ActivateTab(i - 1),
    })
end
return config
