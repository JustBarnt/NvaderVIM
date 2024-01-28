local exist, config = pcall(require, "user.config")
local lsps = exist and type(config) == "table" and config.ensure_installed.mason_lspconfig or {}
local lspconfig = require "lspconfig"
local on_attach = require("core.lsp.lsp_attach").on_attach
local capabilities = require("core.lsp.lsp_attach").capabilities
local border_handlers = require("core.lsp.lsp_attach").rounded_border_handlers
local neo = require "core.lsp.neo"

neo.instantiate()

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettierd", "prettier" },
        javascript = { "prettierd", "prettier" },
    },
})

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            handlers = border_handlers,
        })
    end,
    ["clangd"] = function()
        lspconfig["clangd"].setup({
            on_attach = on_attach,
            capabilities = vim.tbl_extend("force", capabilities, { offsetEncoding = "utf-16" }),
            keys = {
                { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header" },
            },
            root_dir = function(fname)
                local primary = {
                    "Makefile",
                    "configure.ac",
                    "configure.in",
                    "configure.h.in",
                    "meson.build",
                    "meson_options.txt",
                    "build.ninja",
                }
                local fallback = { "compile_commands.json", "compile_flags.json" }
                return lspconfig.util.root_pattern(primary)(fname)
                    or lspconfig.util.root_pattern(fallback)(fname)
                    or lspconfig.util.find_git_ancestor(fname)
            end,
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
        })
    end,
    ["intelephense"] = function()
        lspconfig["intelephenese"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "php", "ctp" },
            --[[ settings = {
                environment = {
                    includePaths
                }
            } ]]
        })
    end,
    ["jsonls"] = function()
        lspconfig["jsonls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })
    end,
    ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    telemetry = { enabled = false },
                    diagnostics = {
                        disable = {
                            "incomplete-signature-doc",
                            "missing-fields",
                        },
                        global = {
                            "vim",
                        },
                        unusedLocalExclude = { "_*" },
                    },
                },
            },
        })
    end,
    ["omnisharp"] = function()
        lspconfig["omnisharp"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = function(fname)
                local primary = lspconfig.util.root_pattern "*.sln"(fname)
                local fallback = lspconfig.util.root_pattern "*.csproj"(fname)
                return primary or fallback
            end,
            analyze_open_documents_only = true,
            organize_imports_on_format = true,
            handlers = {
                ["textDocument/definiton"] = require("omnisharp_extended").handler,
            }
        })
    end,
    ["tsserver"] = function()
        lspconfig["tsserver"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = {
                "javascript",
                "typescript",
                "typescriptreact",
                "javascriptreact",
                "javascript.jsx",
                "typescript.tsx",
            },
            settings = {
                javascript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },
                typescript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                    },
                },
            },
        })
    end,
    ["yamlls"] = function()
        lspconfig["yamlls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemaStore = {
                        -- Disabled to use b0o schemaStore
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        })
    end,
})
