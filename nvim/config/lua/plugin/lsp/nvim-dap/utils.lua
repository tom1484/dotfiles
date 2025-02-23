return {
    add_config = function(dap, key, configs)
        if dap.configurations[key] == nil then
            dap.configurations[key] = configs
        else
            for i = 1, #configs do
                dap.configurations[key][#dap.configurations[key] + 1] = configs[i]
            end
        end
    end,
    register_debugger = function(dap, debugger, adapter_config, templates)
        dap.adapters[debugger] = adapter_config

        dap.registered_adapter = dap.registered_adapter or {}
        dap.registered_adapter[debugger] = adapter_config

        dap.registered_templates = dap.registered_templates or {}
        dap.registered_templates[debugger] = templates
    end,
    create_launch = function(dap)
        -- Create launch.json in .vscode with selected debugger and insert template configurations

        -- Add selected debugger's templates to launch.json
        local function add_debugger_config(launch_file, debugger)
            local file = io.open(launch_file, "r")
            if file == nil then
                print("Failed to open launch.json")
                return
            end

            local content_str = file:read("*a")
            file:close()

            local lunajson = require("lunajson")
            local content = lunajson.decode(content_str)
            if content.configurations == nil then
                content.configurations = {}
            end

            local templates = dap.registered_templates[debugger]
            if templates == nil then
                print("No templates found for " .. debugger)
                return
            end

            for i = 1, #templates do
                content.configurations[#content.configurations + 1] = templates[i]
            end

            local handle = io.popen("echo '" .. lunajson.encode(content) .. "' | jq .")
            if handle == nil then
                print("Failed to open launch.json")
                return
            end
            local fmt = handle:read("*a")
            handle:close()

            file = io.open(launch_file, "w")
            if file == nil then
                print("Failed to open launch.json")
                return
            end
            file:write(fmt)
            file:close()

            print("Added configurations to launch.json")
        end

        -- Retreive debugger list for vim.ui.select
        local function select_debugger(launch_file)
            local debugger_list = {}
            for id, _ in pairs(dap.registered_adapter) do
                debugger_list[#debugger_list + 1] = id
            end

            vim.ui.select(debugger_list, {
                prompt = "Select a debugger",
            }, function(_, idx)
                if idx then
                    add_debugger_config(launch_file, debugger_list[idx])
                end
            end)
        end

        -- Create launch.json if it doesn't exist
        local launch_file = vim.fn.getcwd() .. "/.vscode/launch.json"

        if vim.fn.filereadable(launch_file) == 0 then
            vim.ui.select({ "Yes", "No" }, {
                prompt = "Create launch.json?",
            }, function(_, idx)
                if idx == 1 then
                    vim.fn.mkdir(vim.fn.expand("%:p:h") .. "/.vscode", "p")
                    vim.fn.writefile({ '{"version": "0.2.0", "configurations": []}' }, launch_file)

                    vim.notify("Created launch.json")
                    select_debugger(launch_file)
                end
            end)
        else
            select_debugger(launch_file)
        end
    end,
}
