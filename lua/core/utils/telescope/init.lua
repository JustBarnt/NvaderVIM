local M = {}

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
    ".git/**",
    "--exclude",
    ".svelte-kit/**",
    "--exclude",
    "target/**",
    "--exclude",
    "node_modules/**",
  }

  local has_fd = vim.fn.executable "fd" or vim.fn.executable "fdfind"

  if has_fd == 0 then
    return rg_command
  else
    return fd_command
  end
end

function M.search_for_repos()
  local exists, user_config = pcall(require, "user.config")
  local config = exists and type(user_config) == "table" and user_config.telescope.RepoSettings
    or { enable_home_dir = true, search_dirs = {} }
  local find_command = {
    "fd",
    "--hidden",
    "--color=never",
    "--no-ignore-vcs",
    "--case-sensitive",
    "--absolute-path",
    "--regex",
    "^/.git$|.svn$",
  }

  for i = 1, #config.search_dirs do
    table.insert(find_command, "--search-path")
    table.insert(find_command, config.search_dirs[i])
  end

  if config.enable_home_dir then
    table.insert(find_command, "--search-path")
    table.insert(find_command, vim.env.HOME)
  end

  return find_command
end

return M
