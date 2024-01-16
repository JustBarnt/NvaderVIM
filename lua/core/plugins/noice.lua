local noice = require 'noice'
local exist, user_config = pcall(require, 'user.config')
local pkg = exist and type(user_config) == 'table' and user_config.noice or {}
-- TODO: Use vim.tbl_deep_extend to merge configs together

noice.setup({
    popupmenu = {
        enabled = true,
    },
    messages = {
        view = "mini",
    },
    routes = {
        {
            view = "notify",
            filter = {
                event = { "msg_show", "msg_showmode" },
                ["not"] = {
                    kind = { "confirm", "confirm_sub" },
                },
            },
        },
        --[[ {
            view = 'cmdline',
            filter = {
                event = "cmdline",
                find = "^%s*[/?]",
            }
        } ]]
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        }
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        lsp_doc_border = true,
        inc_rename = false, -- Install inc_rename.nvim to use
        long_message_to_split = true,
    },
})

