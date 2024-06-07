local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("Failed to load Telescope", vim.log.levels.ERROR)
  return
end

local layouts = require("core.plugins.ui.telescope")
local extensions = telescope.extensions
local builtin = require("telescope.builtin")
local telescope_utils = require("core.utils.telescope")
local utils = require("core.utils")
local telescope_extensions = { "luasnip", "noice", "workspaces", "live_grep_args", "hbac" }

telescope.setup({
  defaults = layouts.telescope_defaults,
  extensions = {
    live_grep_args = layouts.vertical_layouts.live_grep_args,
  },
  pickers = {
    find_files = layouts.vertical_layouts.find_files,
    buffers = layouts.vertical_layouts.buffers,
    highlights = layouts.vertical_layouts.highlights,
    grep_string = layouts.vertical_layouts.default,
    current_buffer_fuzzy_find = layouts.vertical_layouts.default,
    help_tags = layouts.vertical_layouts.help_tags,
  },
})

for i = 1, #telescope_extensions do
  pcall(telescope.load_extension, telescope_extensions[i])
end

utils.map("n", "<leader><leader>", builtin.buffers, { desc = "Search Buffers" })
utils.map("n", "<leader>/", extensions.live_grep_args.live_grep_args, { desc = "GRep Project" })
utils.map("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
utils.map("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
utils.map("n", "<leader>sw", telescope_utils.search_word_in_project, { desc = "Search Word in Project" })
utils.map("n", "<leader>sW", telescope_utils.search_string_in_project, { desc = "Search String in Project" })
utils.map("n", "<leader>sp", telescope_utils.search_in_project, { desc = "Search by Grep" })
utils.map("n", "<leader>s/", telescope_utils.search_open_files_for_word, { desc = "Search Open Files for Word" })
utils.map("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Files Neovim Config" })
