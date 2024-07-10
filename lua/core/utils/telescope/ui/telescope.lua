local M = {}

local telescope_utils = require("core.utils.telescope")
local fb_actions = require("telescope._extensions.file_browser.actions")

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
  file_browser = {
    theme = "ivy",
    path = vim.uv.cwd(),
    cwd = vim.uv.cwd(),
    cwd_to_path = false,
    grouped = false,
    files = true,
    add_dirs = true,
    depth = 1,
    auto_depth = false,
    select_buffer = false,
    hidden = { file_browser = false, folder_browser = false },
    respect_gitignore = vim.fn.executable("fd") == 1,
    no_ignore = false,
    follow_symlinks = false,
    browse_files = require("telescope._extensions.file_browser.finders").browse_files,
    browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
    hide_parent_dir = false,
    collapse_dirs = false,
    prompt_path = false,
    quiet = false,
    dir_icon = "",
    dir_icon_hl = "Default",
    display_stat = { date = true, size = true, mode = true },
    hijack_netrw = false,
    use_fd = true,
    git_status = true,
    create_from_prompt = false,
    mappings = {
      ["i"] = {
        ["<A-c>"] = fb_actions.create,
        ["<S-CR>"] = fb_actions.create_from_prompt,
        ["<A-r>"] = fb_actions.rename,
        ["<A-m>"] = fb_actions.move,
        ["<A-y>"] = fb_actions.copy,
        ["<A-d>"] = fb_actions.remove,
        ["<C-o>"] = fb_actions.open,
        ["<C-g>"] = fb_actions.goto_parent_dir,
        ["<C-e>"] = fb_actions.goto_home_dir,
        ["<C-w>"] = fb_actions.goto_cwd,
        ["<C-t>"] = fb_actions.change_cwd,
        ["<C-f>"] = fb_actions.toggle_browser,
        ["<C-h>"] = fb_actions.toggle_hidden,
        ["<C-s>"] = fb_actions.toggle_all,
        ["<bs>"] = fb_actions.backspace,
      },
      ["n"] = {
        ["c"] = fb_actions.create,
        ["r"] = fb_actions.rename,
        ["m"] = fb_actions.move,
        ["y"] = fb_actions.copy,
        ["d"] = fb_actions.remove,
        ["o"] = fb_actions.open,
        ["g"] = fb_actions.goto_parent_dir,
        ["e"] = fb_actions.goto_home_dir,
        ["w"] = fb_actions.goto_cwd,
        ["t"] = fb_actions.change_cwd,
        ["f"] = fb_actions.toggle_browser,
        ["h"] = fb_actions.toggle_hidden,
        ["s"] = fb_actions.toggle_all,
      },
    },
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
