return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "folke/neoconf.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "pmizio/typescript-tools.nvim",
      "b0o/schemastore.nvim",
      "Hoffs/omnisharp-extended-lsp.nvim",
      "stevearc/conform.nvim",
    },
    config = function()
      local lspconfig = require "lspconfig"
      local mason = require "mason"
      local mason_config = require "mason-lspconfig"
      local mason_tools = require "mason-tool-installer"
      local setup_utils = require "core.plugins.lsp.config"
      local setup_server = require "core.plugins.lsp.on_attach"
      local defaults = require "core.plugins.lsp.default-config"

      local ensure_installed, formatters = setup_utils.create_server_install()
      local formatters_by_ft = setup_utils.create_filetype_formatters()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- The following function orders should be kept the same
      setup_utils.configure_neodev()

      mason.setup()
      mason_tools.setup { ensure_installed = vim.tbl_deep_extend("force", ensure_installed, vim.tbl_keys(formatters)) }
      mason_config.setup {
        handlers = {
          function(server_name)
            local server = defaults.servers[server_name] or {}
            lspconfig[server_name].setup {
              cmd = server.cmd,
              settings = server.settings,
              filetypes = server.filetypes,
              root_dir = server.root_dir,
              capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
            }
          end,
        },
      }

      require("typescript-tools").setup {}
      require("conform").setup {
        notify_on_error = true,
        formatters = defaults.conform.formatters,
        formatters_by_ft = formatters_by_ft,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
        callback = function(event)
          setup_server.on_attach(event)
        end,
      })
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    ---@type TailwindTools.Option
    opts = { document_color = { enabled = true, kind = vim.fn.has "nvim-0.10.0-dev" and "inline" or "background" } },
    config = function(_, opts)
      require("tailwind-tools").setup(opts)
    end,
  },
}
