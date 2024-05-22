local map = require("core.utils").map
-- Paste from register
map("i", "<C-v>", '<C-r>"', { desc = "Insert Mode Paste" })

-- Move to the Start / End of a line without leaving insert mode
map("i", "<C-b>", "<C-o>0", { desc = "Jump to front of line" })
map("i", "<C-a>", "<C-o>A", { desc = "Jump to end of line" })

map("n", "<leader>e", "<CMD>.lua<CR>", { desc = "Execute lua on the current line" })
map("n", "<leader><leader>e", "<CMD>so %<CR>", { desc = "Execute the entire file" })

--Override builtin diagnostic jump to also how the float of the diagnostic message
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })

-- Move lines
map("n", "<M-j>", ":m .+1<CR>==", { desc = "Move Line Down" })
map("n", "<M-k>", ":m .-2<CR>==", { desc = "Move Line Up" })
map("i", "<M-j>", "<ESC>:m .+1<CR>==gi", { desc = "[INSERT] Move Line Down" })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "[VISUAL] Move Line Up" })
map("i", "<M-k>", "<ESC>:m .-2<CR>==gi", { desc = "[INSERT] Move Line Up" })
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "[VISUAL] Move Line Down" })

-- Closes a floating window
map("n", "q", function()
  local win_id = vim.api.nvim_get_current_win()

  if vim.api.nvim_win_get_config(win_id).zindex then
    vim.api.nvim_win_close(win_id, true)
  elseif #vim.api.nvim_list_wins() >= 2 and vim.api.nvim_get_current_win() ~= vim.api.nvim_list_wins()[1] then
    vim.api.nvim_win_close(win_id, false)
  end
end, { desc = "Close Float/Window", noremap = true })

-- Disable use of Arrow Keys: use (HJKL)
map("n", "<Left>", "<NOP>")
map("n", "<Down>", "<NOP>")
map("n", "<Up>", "<NOP>")
map("n", "<Right>", "<NOP>")

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

-- Center when joining lines
map("n", "J", "mzJ`z")

-- Close Buffer & Close Buffer without saving
map("n", "<leader>x", "<CMD>Bdelete<CR>", { desc = "Close Current Buffer" })

-- Show Lazy UI
map("n", "<leader>L", ":Lazy<CR>", { desc = "Show Lazy " })

-- Clear HLSearch
map("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "Clear Search Highlights" })
