return {
    get_plugin_configs = function(config_path)
        local plugin_config_path = config_path .. "/lua/plugins"

        local plugin_configs = require("plugin")
        local match_lists = {
            vim.fn.globpath(plugin_config_path, "*/*.lua", true, true),
            vim.fn.globpath(plugin_config_path, "*/*/init.lua", true, true),
        }
        local matches = {}
        for _, match_list in ipairs(match_lists) do
            for _, match in ipairs(match_list) do
                table.insert(matches, match)
            end
        end

        for _, full_path in ipairs(matches) do
            local _, index = string.find(full_path, "lua/")
            local module_path = string.sub(full_path, index + 1, -5)
            -- If start with _, skip
            if string.find(module_path, "/_") == nil then
                local config = require(module_path)
                table.insert(plugin_configs, config)
            else
                -- print("Skip " .. module_path)
            end
        end

        return plugin_configs
    end,
    set_keymaps = function(keymaps)
        for _, mapping in ipairs(keymaps) do
            vim.keymap.set(mapping[1], mapping[2], mapping[3], mapping[4])
        end
    end,
    opts_with_desc = function(opts)
        return function(desc)
            return vim.tbl_extend("force", opts, {
                desc = desc,
            })
        end
    end,
    get_keys = function(t)
        local keys = ""
        for key, _ in pairs(t) do
            keys = keys .. key .. "\n"
        end
        vim.notify(keys)
    end,
    set_highlights = function(groups, opts)
        if type(groups) == "string" then
            groups = { groups }
        end

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, opts)
        end
    end,
    update_highlights = function(groups, opts)
        if type(groups) == "string" then
            groups = { groups }
        end

        for _, group in ipairs(groups) do
            local res = vim.api.nvim_get_hl(0, {
                name = group,
            })
            while res.link do
                res = vim.api.nvim_get_hl(0, {
                    name = res.link,
                })
            end
            res = vim.tbl_extend("force", res, opts)
            vim.api.nvim_set_hl(0, group, res)
        end
    end,
    find_files = function(opt)
        require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = true,
        })
    end,
    match_words = function(list, pattern)
        local matchedEntries = {}

        -- Iterate through the list and apply the pattern
        for _, str in ipairs(list) do
            if string.match(str, pattern) then
                table.insert(matchedEntries, str)
            end
        end

        return matchedEntries
    end,
    split_str = function(str, target)
        local result = {}
        for word in string.gmatch(str, "([^" .. target .. "]+)") do
            table.insert(result, word)
        end
        return result
    end,
    array_last_n = function(list, n)
        local result = {}
        local N = #list
        local i = N - n + 1
        while i <= N do
            table.insert(result, list[i])
            i = i + 1
        end
        return result
    end,
    pinspect = function(obj)
        print(vim.inspect(obj))
    end,
}
