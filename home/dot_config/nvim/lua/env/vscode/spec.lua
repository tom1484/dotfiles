local table_utils = require("utils.table")

local M = {}

M.extend = function(shared_module, extra)
    return table_utils.deep_extend("force", require(shared_module), extra or {})
end

return M
