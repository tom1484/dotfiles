local M = {}

M.enabled = {
    bash = true,
    lua = true,
    c = true,
    python = true,
    dart = true,
    go = true,
    rust = true,
    web = true,
    julia = true,
    misc = true,
}

M.filter_languages = function(config)
    local allowed_packages = {}

    for lang, packages in pairs(config) do
        if M.enabled[lang] then
            for _, package in ipairs(packages) do
                table.insert(allowed_packages, package)
            end
        end
    end

    return allowed_packages
end

return M
