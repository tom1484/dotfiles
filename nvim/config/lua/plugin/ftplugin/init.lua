local plugins = {
    "rust",
}
local M = {}

for _, plugin in ipairs(plugins) do
    local contents = require("plugin.ftplugin." .. plugin)
    for _, content in ipairs(contents) do
        table.insert(M, content)
    end
end
--
-- print(vim.inspect(M))

return M
