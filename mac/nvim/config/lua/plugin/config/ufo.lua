vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local opts = vim.custom.fn.opts_with_desc({
    silent = true,
})
vim.custom.fn.set_keymaps({
    { "n", "zM", require("ufo").closeAllFolds, opts("Close all folds") },
    { "n", "zR", require("ufo").openAllFolds, opts("Open all folds") },
})

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    -- table.insert(newVirtText, { suffix, "MoreMsg" })
    table.insert(newVirtText, { suffix, "UfoFoldedBg" })
    return newVirtText
end

require("ufo").setup({
    fold_virt_text_handler = handler,
    open_fold_hl_timeout = 50,
    -- provider_selector = function(bufnr, filetype, buftype)
    provider_selector = function(_, _, _)
        return { "treesitter", "indent" }
    end,
})
