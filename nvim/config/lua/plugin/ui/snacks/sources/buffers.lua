return {
    current = false,
    sort_lastused = true,
    win = {
        input = {
            keys = {
                ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
            },
        },
        list = { keys = { ["dd"] = "bufdelete" } },
    },
}
