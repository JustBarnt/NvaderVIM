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
        local num_of_wins = vim.api.nvim_list_wins()
        local ft = vim.bo.ft

        if #num_of_wins > 1 and ft ~= 'TelescopePrompt' then
            vim.api.nvim_win_close(0,false)
        elseif ft == 'TelescopePrompt' then
            require('telescope.actions').close(vim.api.nvim_get_current_buf())
        end

    end, { desc = "Close Float/Window", noremap = false })

    -- Disable use of Arrow Keys: use (HJKL)
    map("n", "<Left>", ":echo 'Use h instead'<CR>")
    map("n", "<Down>", ":echo 'Use j instead'<CR>")
    map("n", "<Up>", ":echo 'Use k instead'<CR>")
    map("n", "<Right>", ":echo 'Use l instead'<CR>")

    map("i", "<Left>", "<NOP>")
    map("i", "<Down>", "<NOP>")
    map("i", "<Up>", "<NOP>")
    map("i", "<Right>", "<NOP>")

    map("i", "<S-Left>", "<NOP>")
    map("i", "<S-Down>", "<NOP>")
    map("i", "<S-Up>", "<NOP>")
    map("i", "<S-Right>", "<NOP>")

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

    -- Easy return to normal mode
    map("i", "JK", "<ESC>", { desc = "Return to normal mode" })

    -- Split Buffer
    map("n", "<leader>bv", ":vsplit", { desc = "Prompt Split Buffer" })

    -- Center when joining lines
    map("n", "J", "mzJ`z")

    -- Return to file explorer
    map("n", "<leader>pv", vim.cmd.Ex, { desc = "Show File Tree" })

    -- Close Buffer & Close Buffer without saving
    map("n", "<leader>x", ":bd<CR>", { desc = "Close Current Buffer" })
    map("n", "<leader>X", ":bd!<CR>", { desc = "Close Current Buffer W/O Saving" })

    -- Clear Highlight after searching
    map("n", "<leader>sc", ':let @/ = ""<CR>', { desc = "Clear Search Highlights" })

    -- Move line up and down in VISUAL MODE
    map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected lines down", noremap = false })
    map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected lines up", noremap = false })

    -- Show Lazy UI
    map("n", "<leader>L", ":Lazy<CR>", { desc = "Show Lazy " })

    -- Saving and Quitting Files Quicker
    map("n", "<leader>w", ":w<CR>", { desc = "Save File" })
    map("n", "<leader>W", ":w!<CR>", { desc = "Overwrite File" })
    map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
    map("n", "<leader>Q", ":q!<CR>", { desc = "Quit without saving" })
    map("n", "<leader>qa", ":qall<CR>", { desc = "Quit All"})
end

M.Lsp = function()
    local handlers = require 'core.lsp.handlers'
    map( "i", "<C-s>", vim.lsp.buf.signature_help, { desc = "Signature Help" } )
    map( "n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbols" })
    map( "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" } )
    map( "n", "gd", vim.lsp.buf.definition, { desc = "Go-To Definition" } )
    map( "n", "gD", vim.lsp.buf.declaration, { desc = "Go-To Declaration" })
    map( "n", "gT", vim.lsp.buf.type_definition, { desc = "Go-To Defintion" } )
    map( "n", "K", vim.lsp.buf.hover, { desc = "Peek Definition" } )
    map( "n", "<leader>gI",  handlers.implementation)
    map( "n", "<leader>rr", "LspRestart" )

    map("n", "<leader>clr", "<CMD>lua require('core.lsp.codelens').run()<CR>", { desc = "Start Codelens" })

    map("n", "<leader>lf", "<CMD>LspFormat<CR>", { desc = "LSP Format" })
    map("n", "<leader>lr", "<CMD>LspRestart<CR>", { desc = "LSP Restart" })
    map("n", "<leader>li", "<CMD>LspInfo<CR>", { desc = "LSP Info" })
    map("n", "<leader>ls", "<CMD>LspStart<CR>", { desc = "LSP Start" })
    map("n", "<leader>lk", "<CMD>LspStop<CR>", { desc = "LSP Stop" })
end

return M

