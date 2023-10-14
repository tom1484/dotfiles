return function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client ~= nil and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint(ev.buf, true)
    end

    local lsp_signature = require("lsp_signature")
    lsp_signature.on_attach({
        bind = true,
        floating_window = false,
        -- floating_window = true,
        handler_opts = {
            border = "rounded",
        },
    }, ev.buf)

    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
end
