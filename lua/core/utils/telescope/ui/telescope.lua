local M = {}

local telescope_utils = require("core.utils.telescope")

M.vertical_layouts = {
  default = {
    previewer = false,
    layout_strategy = "vertical",
  },
  buffers = {
    previewer = false,
    prompt_title = "Buffers",
    mappings = {
      i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
      n = { ["d"] = require("telescope.actions").delete_buffer },
    },
  },
  find_files = {
    telescope_utils.select_find_command(),
    previewer = false,
  },
  help_tags = {
    prompt_title = "Search Help",
    layout_strategy = "horizontal",
    layout_config = {
      height = 0.9,
      width = 0.9,
      prompt_position = "bottom",
    },
  },
  highlights = {
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "bottom",
    },
  },
  live_grep_args = {
    previewer = true,
    prompt_title = "Global Search (w/args)",
  },
}

M.telescope_defaults = {
  layout_strategy = "vertical",
  sorting_strategy = "ascending",
  results_title = "",
  prompt_prefix = "  ",
  selection_caret = "  ",
  entry_prefix = "   ",
  layout_config = {
    prompt_position = "top",
    width = 0.5,
    height = 0.5,
  },
  path_display = { filename_first = { reverse_directories = false } },
  mappings = {
    i = {
      ["<C-k>"] = require("telescope.actions").move_selection_previous,
      ["<C-j>"] = require("telescope.actions").move_selection_next,
      ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
    },
  },
}

return M
