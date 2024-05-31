local M = {}

M.conform = {
  formatters = {
    stylua = {
      command = vim.fn.stdpath("data") .. "\\mason\\bin\\stylua.cmd",
    },
    prettierd = {
      command = vim.fn.stdpath("data") .. "\\mason\\bin\\prettierd.cmd",
    },
    prettier = {
      command = vim.fn.stdpath("data") .. "\\mason\\bin\\prettier.cmd",
    },
  },
  formatters_by_ft = {
    lua = { "stylua" },
    svelte = { "prettierd" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
  },
}

M.servers = {
  bashls = {},
  html = {},
  svelte = {},
  gopls = {},
  cssls = {},
  lua_ls = require("core.plugins.lsp.servers.lua_ls"),
  intelephense = require("core.plugins.lsp.servers.intelephense"),
  jsonls = require("core.plugins.lsp.servers.jsonls"),
  clangd = require("core.plugins.lsp.servers.clangd"),
  powershell_es = require("core.plugins.lsp.servers.powershell_es"),
  yamlls = require("core.plugins.lsp.servers.yamlls"),
  tailwindcss = require("core.plugins.lsp.servers.tailwindcss"),
}

return M
