return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        local alpha = require 'alpha'
        local alpha_term = require 'alpha.term'
        local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]

        local make_header = function()
            local lines = {}
             
            for i, line_chars in pairs(logo) do
                local line = {
                    type = "text",
                    val = line_chars,
                    opts = {
                        hl = "AlphaSpecialKey" .. i,
                        shrink_margin = false,
                        position = "center"
                    }
                }
                table.insert(lines, line)
            end

            local output = {
                type = "group",
                value = lines,
                opts = { position = "center" },
            }

            return output
        end

        local terminal = {
            type = "terminal",
            command = vim.fn.expand("$HOME") .. "/.config/nvim/lua/user/thisisfine.sh",
            width = 46,
            height = 25,
            opts = {
                redraw = true,
                window_confing = {}
            },  
        }

        local prg = io.popen('echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"')
        local date = prg and prg:read("*a")
        prg:close()
        
        local heading = {
            type = "text",
            val = ". Today is " .. date .. " .",
            opts = {
                position = "center",
                hl = "Folded"
            },
        }

        local section = {
            header = make_header(),
            heading = heading,
            terminal = terminal,
            buttons = {
                type = "group",
                val = {

                },
                opts = {
                    spacing = 1,
                },
            }
        }

        local marginTopPercent = 0.225
        local headerPadding = vim.fn.max {4, vim.fn.floor(vim.fn.winheight(0) * marginTopPercent)}

        local padding =function(value)
            return { type = 'padding', val = value }
        end

        local config = {
            layout = {
                padding(headerPadding),
                section.terminal,
                padding(4),
                section.heading,
                padding(2),
                section.buttons
            },
            opts = {
                margin = vim.fn.floor(vim.fn.winwidth(0) / 2 - 46 / 2),
            },
        }

        vim.api.nvim_create_autocmd('FileType', {
            pattern = "alpha",
            callback = function()
                local old_laststatus = vim.opt.laststatus
                
                vim.api.nvim_create_autocmd("BufUnload", {
                    buffer = 0,
                    callback = function()
                        vim.opt.laststatus = old_laststatus
                    end,
                })

                vim.opt.laststatus = 0
            end,
        })

        vim.api.nvim_create_autocmd("WinResized", {
            group = "alpha",
            callback = function()
                alpha.redraw()
            end,
        })

        return config
    end,
}
