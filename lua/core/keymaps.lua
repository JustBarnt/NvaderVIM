local map = require 'core.utils'.map

local M = {}

M.Default_Keymaps = function()
  -- Paste from register
  map("i", "<C-v>", "<C-r>\"")

  -- Prevent macro keybinds
  map("n", "q", "<NOP>")
  map("n", "Q", "<NOP>")

  -- Return to file explorer
  map("n", "<leader>pv", vim.cmd.Ex, { desc = "Show File Tree"})

  -- Close Buffer & Close Buffer without saving
  map("n", "<leader>x", ":bd<CR>", { desc = "Close Current Buffer"})
  map("n", "<leader>X", ":bd!<CR>", { desc = "Close Current Buffer W/O Saving"})

  -- Clear Highlight after searching
  map("n", "<leader>sc", ":let @/ = \"\"<CR>", { desc = "Clear Search Highlights"})

  -- Move line up and down in VISUAL MODE
  map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected lines down"})
  map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected lines up"})

  -- Show Lazy UI
  map("n", "<leader>L", ":Lazy<CR>", { desc = "Show Lazy"})
  map("n", "<leader>w", ":w!<CR>", { desc = "Save File"})
  map("n", "<leader>q", ":q!<CR>", { desc = "Quit"})
end

return M

