local map = require 'core.utils'.map

local M = {}

M.Default = function()
    -- Paste from register
    map("i", "<C-v>", "<C-r>\"", { desc = "Insert Mode Paste" })

    -- Move to the Start / End of a line without leaving insert mode
    map("i", "<C-b>", "<C-o>0", { desc = "Jump to front of line" })
    map("i", "<C-a>", "<C-o>A", { desc = "Jump to end of line" })

    -- Prevent macro keybinds
    map("n", "Q", "<NOP>")
    map("n", "q", function()
        local windows = vim.api.nvim_list_wins()
        local ft = vim.bo.ft
        
        -- Solution is instead of trying to close the windows, its check the buffers and just close the current buffer instead of the current
        -- window, when there is only one buffer, open Oil in current dir
       
        if #windows > 1 and ft ~= 'TelescopePrompt' then
            vim.api.nvim_win_close(0, true)
        elseif ft == 'TelescopePrompt' then
            require('telescope.actions').close(vim.api.nvim_get_current_buf())
        end

    end, { desc = "Close Float/Window", noremap = false })

    -- Disable use of Arrow Keys: use (HJKL)
    map("n", "<Left>", "<NOP>")
    map("n", "<Down>", "<NOP>")
    map("n", "<Up>", "<NOP>")
    map("n", "<Right>", "<NOP>")

    -- Fix descrepancy between nvim builtin matching (%) and nvim-comment plugin
    map("n", "<leader>_gc", "<CMD>call CommentOperator(visualmode())<CR>")

    -- Center cursor when navigating search results
    map("n", "n", "nzz")
    map("n", "N", "Nzz")

    -- Paste Above / Below Current Line
    map("n", "<leader>p", "o<C-c>p==", { desc = "Paste Below" })
    map("n", "<leader>P", "O<C-c>P==", { desc = "Paste Above" })

    -- Moving Between Panes: Terminal, Split panes, etc.
    map({ "n", "t" }, "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Move Pane: Left" })
    map({ "n", "t" }, "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Move Pane: Down" })
    map({ "n", "t" }, "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Move Pane: Up" })
    map({ "n", "t" }, "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Move Pane: Right" })

    map({"n", "t"}, "<S-h>", "[[<Cmd>bp<CR>]]", { desc = "Jump to Previous Buffer"})
    map({"n", "t"}, "<S-l>", "[[<Cmd>bn<CR>]]", { desc = "Jump to Next Buffer"})

    -- Center when joining lines
    map("n", "J", "mzJ`z")

    -- Close Buffer & Close Buffer without saving
    map("n", "<leader>x", ":bd<CR>", { desc = "Close Current Buffer" })

    -- Clear Highlight after searching
    map("n", "<leader>sc", ':let @/ = ""<CR>', { desc = "Clear Search Highlights" })

    -- Move line up and down in VISUAL MODE
    map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected lines down", noremap = false })
    map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected lines up", noremap = false })

    -- Show Lazy UI
    map("n", "<leader>L", ":Lazy<CR>", { desc = "Show Lazy " })
    end
return M

