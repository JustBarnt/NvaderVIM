if vim.g.has_nushell then
  local lspconfig = require("lspconfig")
  local configs = require("lspconfig.configs")
  vim.filetype.add({
    extension = {
      nu = "nu",
      nush = "nu",
      nuon = "nu",
      nushell = "nu",
    },
    pattern = {
      ["."] = {
        function(path, bufnr)
          local content = vim.filetype.getlines(bufnr, 1)
          if vim.fileytpe.matchregex(content, [[^#!/usr/bin/env nu]]) then
            return "nu"
          end
        end,
        priority = -math.huge,
      },
    },
  })

  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  ---@diagnostic disable-next-line: inject-field
  parser_config.nu = {
    install_info = {
      url = "https://github.com/nushell/tree-sitter-nu",
      files = { "src/parser.c" },
      branch = "main",
    },
    filetype = "nu",
  }

  configs.nulsp = {
    default_config = {
      cmd = { "nu", "--lsp" },
      filetypes = { "nu" },
      root_dir = function(fname)
        local git_root = lspconfig.util.find_git_ancestor(fname)
        if git_root then
          return git_root
        else
          return vim.fn.fnamemodify(fname, "p:h")
        end
      end,
    },
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  lspconfig.nulsp.setup({ capabilities = capabilities, on_init = function() end })
end
