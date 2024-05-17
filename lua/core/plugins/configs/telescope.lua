local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("Failed to load Telescope", vim.log.levels.ERROR)
  return
end

local extensions = telescope.extensions
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local telescope_utils = require("core.utils.telescope")
local utils = require("core.utils")
local telescope_extensions = { "themes", "luasnip", "noice", "workspaces", "live_grep_args" }

-- Create a re-usable function for Which-key to create
-- easy mappings that are already added to Which-key

utils.map("n", "<leader>sc", "<CMD>Telescope themes<CR>", { desc = "Search Colorschemes" })
utils.map("n", "<leader><leader>", builtin.buffers, { desc = "Search Buffers" })
utils.map("n", "<leader>/", extensions.live_grep_args.live_grep_args, { desc = "GRep Project" })
utils.map("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
utils.map("n", "<leader>sw", telescope_utils.search_word_in_project, { desc = "Search Word in Project" })
utils.map("n", "<leader>sW", telescope_utils.search_string_in_project, { desc = "Search String in Project" })
utils.map("n", "<leader>sp", telescope_utils.search_in_project, { desc = "Search by Grep" })
utils.map("n", "<leader>s/", telescope_utils.search_open_files_for_word, { desc = "Search Open Files for Word" })

telescope.setup {
  defaults = {
    path_display = { filename_first = { reverse_directories = false } },
    mappings = {
      i = { ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist },
      n = { ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist },
    },
  },
  extensions = {
    themes = {
      require("telescope.themes").get_dropdown {
        layout_config = { width = 120, height = 60 },
      },
      enable_live_preview = true,
      persist = { enabled = true, path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua" },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
        n = { ["d"] = actions.delete_buffer },
      },
    },
    find_files = telescope_utils.select_find_command(),
  },
}

for i = 1, #telescope_extensions do
  pcall(telescope.load_extension, telescope_extensions[i])
end

local telescope_any_options = {
  pickers = {
    [""] = builtin.find_files,
    [":"] = builtin.current_buffer_fuzzy_find,
    ["/"] = extensions.live_grep_args.live_grep_args,
    ["m "] = builtin.marks,
    ["q "] = builtin.quickfix,
    ["l "] = builtin.loclist,
    ["j "] = builtin.jumplist,
    ["h "] = builtin.help_tags,
    ["b "] = builtin.buffers,
    ["d "] = builtin.diagnostics,
    ["au "] = builtin.autocommands,
    ["hi "] = builtin.highlights,
    ["gs "] = builtin.git_status,
    ["gb "] = builtin.git_branches,
    ["gc "] = builtin.git_commits,
    ["ws "] = extensions.workspaces.workspaces,
    ["sym "] = builtin.lsp_document_symbols,
    ["cmd "] = builtin.commands,
    ["noti "] = extensions.noice.noice,
    ["ctags "] = builtin.current_buffer_tags,
    ["keymaps "] = builtin.keymaps,
    ["options "] = builtin.vim_options,
    ["tags "] = extensions.grapple.tags,
  },
}

local telescope_any = require("telescope-any").create_telescope_any(telescope_any_options)
utils.map("n", "<leader><localleader>", "", {
  noremap = true,
  silent = true,
  callback = telescope_any,
  desc = "Telescope Command Palette",
})
