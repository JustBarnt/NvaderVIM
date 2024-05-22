local M = {}

function M.on_attach(event)
  local map = require("core.utils").map
  local builtin = require("telescope.builtin")
  require("core.plugins.lsp.handlers")

  map("n", "gd", "<CMD>Glance definitions<CR>", { buffer = event.buf, desc = "Go-To Definition" })
  map("n", "gr", "<CMD>Glance references<CR>", { buffer = event.buf, desc = "Symbol References" })
  map("n", "gI", "<CMD>Glance implementations<CR>", { buffer = event.buf, desc = "Go-To Implementations" })
  map("n", "gT", "<CMD>Glance type_definitions<CR>", { buffer = event.buf, desc = "Go-To Defintion" })
  map("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "Go-To Declaration" })
  map("n", "<leader>lds", builtin.lsp_document_symbols, { buffer = event.buf, desc = "Document Symbols" })
  map("n", "<leader>lws", builtin.lsp_workspace_symbols, { buffer = event.buf, desc = "Workspace Symbols" })
  map("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "Signature Help" })
  map("n", "<leader>cr", ":IncRename ", { buffer = event.buf, desc = "Rename Symbols" })
  map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Code Actions" })
  map("n", "<leader>lf", "<CMD>LspFormat<CR>", { buffer = event.buf, desc = "LSP Format" })
  map("n", "<leader>lr", "<CMD>LspRestart<CR>", { buffer = event.buf, desc = "LSP Restart" })
  map("n", "<leader>li", "<CMD>LspInfo<CR>", { buffer = event.buf, desc = "LSP Info" })
  map("n", "<leader>ls", "<CMD>LspStart<CR>", { buffer = event.buf, desc = "LSP Start" })
  map("n", "<leader>lk", "<CMD>LspStop<CR>", { buffer = event.buf, desc = "LSP Stop" })

  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = event.buf,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = event.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- Disables "No information available" warning from lsp when using 'Hover'
  if client and client.server_capabilities.hoverProvider then
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      silent = true,
    })
  end
end

return M
