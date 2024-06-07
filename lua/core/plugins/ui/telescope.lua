local M = {}

local telescope_utils = require("core.utils.telescope")
local prompt_chars = { "▔", "▕", "▁", "▏", "▛", "▜", "▛", "▜" }
local vert_preview_chars = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙" }

M.vertical_layouts = {
  default = {
    previewer = true,
    layout_strategy = "vertical",
    layout_config = { mirror = true },
    preview_title = "",
    borderchars = {
      prompt = prompt_chars,
      preview = vert_preview_chars,
      results = prompt_chars,
    },
  },
  buffers = {
    previewer = true,
    prompt_title = "Buffers",
    mappings = {
      i = { ["<c-d>"] = require("telescope.actions").delete_buffer },
      n = { ["d"] = require("telescope.actions").delete_buffer },
    },
  },
  find_files = {
    telescope_utils.select_find_command(),
    previewer = true,
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
  sort_mru = true,
  sorting_strategy = "ascending",
  layout_config = { prompt_position = "top" },
  borderchars = {
    prompt = prompt_chars,
    results = prompt_chars,
    preview = prompt_chars,
  },
  border = true,
  multi_icon = "",
  entry_prefix = "   ",
  prompt_prefix = "   ",
  selection_caret = "  ",
  hl_result_eol = true,
  results_title = "",
  winblend = 0,
  wrap_results = false,
  path_display = { filename_first = { reverse_directories = false } },
  mappings = {
    i = {
      ["<C-k>"] = require("telescope.actions").move_selection_previous,
      ["<C-j>"] = require("telescope.actions").move_selection_next,
      ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
    },
  },
  preview = { treesitter = true },
}

return M
