local M = {}

local function expect_table(value, name)
    assert(type(value) == "table", string.format("settings.%s must be a table", name))
end

M.validate = function(settings)
    expect_table(settings, "root")
    expect_table(settings.options, "options")
    expect_table(settings.style, "style")
    expect_table(settings.indent, "indent")
    expect_table(settings.keymaps, "keymaps")

    assert(type(settings.style.border) == "string", "settings.style.border must be a string")
    expect_table(settings.indent.default, "indent.default")
    expect_table(settings.indent.default.options, "indent.default.options")
    expect_table(settings.indent.extras, "indent.extras")
    expect_table(settings.keymaps.common, "keymaps.common")
    expect_table(settings.keymaps.lazy, "keymaps.lazy")
    expect_table(settings.keymaps.vscode, "keymaps.vscode")
    expect_table(settings.keymaps.vscode_lazy, "keymaps.vscode_lazy")
    expect_table(settings.keymaps.which_key_groups, "keymaps.which_key_groups")
end

return M
