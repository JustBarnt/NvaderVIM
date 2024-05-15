local M = {}
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

function M.search_word_in_project()
  builtin.grep_string { search = vim.fn.expand("<cword>") }
end

function M.search_string_in_project()
  builtin.grep_string { search = vim.fn.expand("<cWORD>") }
end

function M.search_open_files_for_word()
  extensions.live_grep_args.live_grep_args { grep_open_files = true, prompt_title = "Search in Open Files" }
end

function M.search_in_project()
  builtin.grep_string { search = vim.fn.input { prompt_title = "Grep >" } }
end
--- Sets the executable used for find_files based on whether or not FD is found.
function M.select_find_command()
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

return M
