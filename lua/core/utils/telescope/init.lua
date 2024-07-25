local M = {}

M.search_word_in_project = function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end

M.search_string_in_project = function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cWORD>") })
end

M.search_open_files_for_word = function()
  require("telescope").extensions.live_grep_args.live_grep_args({ grep_open_files = true, prompt_title = "Search in Open Files" })
end

M.search_in_project = function()
  require("telescope.builtin").grep_string({ search = vim.fn.input({ prompt_title = "Grep >" }) })
end
--- Sets the executable used for find_files based on whether or not FD is found.
M.select_find_command = function()
  local rg_command = {
    "rg",
    "--files",
    "--color=never",
    "--no-heading",
    "--line-number",
    "--column",
    "--smart-case",
    "--hidden",
    "--glob",
    "!{.git/*,.svelte-kit/*,target/*,node_modules/*}, lua/user/*",
    "--path-separator",
    "/",
  }

  local fd_command = {
    "fd",
    "--type=f",
    "--color=never",
    "--path-separator=/",
    "--hidden",
    "--no-ignore",
    "--exclude",
    ".git",
    "--exclude",
    ".svelte-kit",
    "--exclude",
    "target",
    "--exclude",
    "node_modules",
  }

  local has_fd = vim.fn.executable("fd") or vim.fn.executable("fdfind")

  if has_fd == 0 then
    return rg_command
  else
    return fd_command
  end
end

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
    M.select_find_command(),
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
