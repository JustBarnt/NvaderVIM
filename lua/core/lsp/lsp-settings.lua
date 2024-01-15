local M = {}

M.on_attach = function(client, bufnr)
    require 'core.keymaps'.Lsp()
    local filetype = vim.api.nvim_buf_get_option(0, "filetype")

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.MiniCompletion.completefunc_lsp")
    --vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

    if client.server_capabilities.documentHighlightProvider then
        local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
        vim.api.nvim_clear_autocmds({ group = augroup_highlight, buffer = bufnr })

        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            callback = vim.lsp.buf.document_highlight,
            group = augroup_highlight,
            buffer = bufnr
        })

        vim.api.nvim_create_autocmd({ "CursorMoved" }, {
            callback = vim.lsp.buf.clear_references,
            group = augroup_highlight,
            buffer = bufnr
        })
    end

    if filetype == "typescript" or filetype == "lua" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

return M

