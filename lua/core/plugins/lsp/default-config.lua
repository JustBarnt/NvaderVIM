local M = {}

M.conform = {
  formatters = {
    stylua = {
      command = vim.fn.stdpath("data") .. "\\mason\\bin\\stylua.cmd",
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
  },
}

M.servers = {
  bashls = {},
  html = {},
  svelte = {},
  gopls = {},
  lua_ls = require("core.plugins.lsp.servers.lua_ls"),
  intelephense = require("core.plugins.lsp.servers.intelephense"),
  jsonls = require("core.plugins.lsp.servers.jsonls"),
  clangd = require("core.plugins.lsp.servers.clangd"),
  powershell_es = require("core.plugins.lsp.servers.powershell_es"),
  yamlls = require("core.plugins.lsp.servers.yamlls"),
  tailwindcss = require("core.plugins.lsp.servers.tailwindcss"),
}

return M
