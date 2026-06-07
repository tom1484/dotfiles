return {
    current = false,
    sort_lastused = true,
    jump = { reuse_win = true },
    layout = { preset = "select", preview = false },
    formatters = {
        file = {
            truncate = 60,
        },
    },
    win = {
        input = {
            keys = {
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
            },
        },
        list = { keys = { ["dd"] = "bufdelete" } },
    },
}
