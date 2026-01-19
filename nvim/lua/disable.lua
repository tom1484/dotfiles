-- Copy lua/.disable.lua.local to lua/.disable.lua and
--     add local disable settings in lua/.disable.lua to avoid git updates

return {
    language = {
        "go",
        "dart",
    },
    plugin = {
        "edit/cmp",
        "theme/transparent",
        "ai/CopilotChat",
        "ai/aider",
        "ai/avante",
        "ui/barbar",
    }
}
