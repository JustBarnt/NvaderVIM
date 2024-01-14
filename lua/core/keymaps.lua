local map = require 'core.utils'.map

local M = {}

M.Default = function()
  -- Paste from register
  map("i", "<C-v>", "<C-r>\"", { desc = "Insert Mode Paste" })

  -- Move to the Start / End of a line without leaving insert mode
  map("i", "<C-b>", "<C-o>0", { desc = "Jump to front of line" })
  map("i", "<C-a>", "<C-o>A", { desc = "Jump to end of line" })

  -- Prevent macro keybinds
  map("n", "q", "<NOP>")
  map("n", "Q", "<NOP>")

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
  map("n", "<leader>sc", ":let @/ = \"\"<CR>", { desc = "Clear Search Highlights" })

  -- Move line up and down in VISUAL MODE
  map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected lines down", noremap = false })
  map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected lines up", noremap = false })

  -- Show Lazy UI
  map("n", "<leader>L", ":Lazy<CR>", { desc = "Show Lazy "})

  -- Saving and Quitting Files Quicker
  map("n", "<leader>w", ":w<CR>", { desc = "Save File" })
  map("n", "<leader>W", ":w!<CR>", { desc = "Overwrite File" })
  map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
  map("n", "<leader>Q", ":q!<CR>", { desc = "Quit All without saving" })
end

M.Telescope = function()
  local builtin = require 'telescope.builtin'

  map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
  map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
  map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
end

M.Lsp = function()
    local conform = require 'conform'

    map("n", "<leader>lf",
        function()
            conform.format({ async = true, lsp_fallback = true})
        end,
        { desc = "LSP Format"})
end

return M

