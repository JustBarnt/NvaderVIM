return {
  root_dir = require("lspconfig.util").root_pattern(
    "lua",
    ".stylua.toml",
    "lazy-lock.json",
    ".neoconf.json",
    "neoconf.json"
  ),
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      completion = {
        callSnippet = "Both",
      },
      hint = {
        enable = true,
      },
      diagnostics = {
        disable = {
          "incomplete-signature-doc",
          "missing-fields",
        },
        globals = {
          "vim",
        },
        unusedLocalExclude = { "_*" },
      },
    },
  },
}
