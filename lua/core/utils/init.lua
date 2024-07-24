require("core.utils.gx")
local api = vim.api
local M = {}

--- Returns the status of the plugin
--- @param plugin string
--- @return boolean | nil
--- @return LazyPlugin | nil
function M.has(plugin)
  local ok, name = pcall(require, tostring(plugin))
  if not ok then
    error("Attempt to load " .. plugin .. " failed:\nPlease confirm plugin is installed")
    return nil, nil
  end
  return ok, name
end

--- Returns true if the buffer is large than X size
---@param bufnr integer The buffer to check
---@param size integer The max size allowed in bytes
---@return boolean
function M.is_large_buffer(bufnr, size)
  local is_large_buf = false
  local max_filesize = size * 1024
  local ok, stats = pcall(vim.uv.fs_stat, api.nvim_buf_get_name(bufnr))
  if ok and stats and stats.size > max_filesize then
    is_large_buf = true
  end

  return is_large_buf
end

--- Wrapper for `vim.keymap.set`
---@param mode string Mode the keymap can work in
---@param lhs string The left hand side AKA: Key combination to activate
---@param rhs string|function The right hand side AKA: The action to invoke
---@param opts? table A table of options the `vim.keymap.set` supports
function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

return M
