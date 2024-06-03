local M = {}

--- Creates a Server/Formatter install list for the Mason Tools library
---@return string[], string[]
function M.create_server_install()
  local defaults = require("core.plugins.lsp.default-config")
  local exists, user_config = pcall(require, "user.config")
  local default_servers = vim.tbl_keys(defaults.servers)
  local default_formatters = defaults.conform.formatters
  local user_servers = exists and type(user_config) == "table" and user_config.servers or {}
  local user_formatters = exists and type(user_config) == "table" and user_config.formatters.ensure_installed or {}

  vim.tbl_deep_extend("force", default_servers, vim.tbl_keys(user_servers))
  vim.tbl_deep_extend("force", default_formatters, vim.tbl_keys(user_formatters))
  return default_servers, default_formatters
end

--- Builds a table of filetype formatters from the default and user if available
---@return table<string, string|string[]|string[][]>
function M.create_filetype_formatters()
  local defaults = require("core.plugins.lsp.default-config")
  local default_ft = defaults.conform.formatters_by_ft
  local exists, user_config = pcall(require, "user.config")
  local user_ft = exists and type(user_config) == "table" and user_config.formatters.formatters_by_ft or {}

  vim.tbl_deep_extend("force", default_ft, user_ft)
  return default_ft
end

--- Configures Neodev and Neoconf before LSP setup
function M.configure_neodev()
  local neoconf = vim.F.npcall(require, "neoconf")

  if neoconf then
    neoconf.setup()
  end
end

return M
