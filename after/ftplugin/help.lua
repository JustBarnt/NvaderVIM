local cmd = vim.api.nvim_create_autocmd

cmd('BufWinEnter', {
    pattern = '*',
    callback = function(event)
        local ft = vim.bo[event.buf].filetype

        vim.bo[event.buf].buflisted = true
        if(ft == 'help') then
            vim.cmd.vsplit()
            -- require('detour').Detour()
        end
    end
})
