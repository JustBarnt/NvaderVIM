return {
    single_file_support = true,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false
            },
            telemetry = { enable = false },
            completion = {
                workspaceWord = true,
                callSnippet = "Both",
            },
            hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
            },
            hover = {
                expandAlias = false,
            },
            diagnostics = {
                disable = {
                    "incomplete-signature-doc",
                    "missing-fields"
                },
                global = {
                    "vim",
                },
                unusedLocalExclude = { "_*" },
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                    continuation_indent_size = "2"
                }
            },
        },
    }
}

