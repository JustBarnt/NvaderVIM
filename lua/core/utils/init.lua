require("core.utils.gx")
local api = vim.api
local M = {}

--- Returns true if the buffer is large than X size
--- @param bufnr integer The buffer to check
--- @param size integer The max size allowed in bytes
--- @return boolean is_large_buf
M.is_large_buffer = function(bufnr, size)
  local is_large_buf = false
  local max_filesize = size * 1024
  local ok, stats = pcall(vim.uv.fs_stat, api.nvim_buf_get_name(bufnr))
  if ok and stats and stats.size > max_filesize then
    is_large_buf = true
  end

  return is_large_buf
end

--- Wrapper for `vim.keymap.set`
--- @see vim.keymap.set
--- @param mode string | table
--- @param lhs string
--- @param rhs string|function
--- @param opts? table
M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

---@param name string
---@param fn fun(name:string)
M.on_load = function(name, fn)
  if M.is_loaded(name) then
    fn(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

M.mini = require("core.utils.mini")
M.telescope = require("core.utils.telescope")
-- M.cmp = require("core.utils.cmp")
M.icons = require("core.utils.icons")
return M
