local has_lualine, lualine = pcall(require, "lualine")
local has_lsp_progress, lsp_progress = pcall(require, "lsp-progress")

if not has_lualine then
  error("Failed to load lualine", vim.log.levels.ERROR)
  return
end

if not has_lsp_progress then
  error("Failed to load  lsp-progress", vim.log.levels.ERROR)
  return
end

lsp_progress.setup({
  client_format = function(client_name, spinner, series_messages)
    if #series_messages == 0 then
      return nil
    end
    return {
      name = client_name,
      body = spinner .. " " .. table.concat(series_messages, ", "),
    }
  end,
  format = function(client_messages)
    --- @param name string
    --- @param msg string?
    --- @return string
    local function stringify(name, msg)
      return msg and string.format("%s %s", name, msg) or name
    end

    local sign = "" -- nf-fa-gear \uf013
    local lsp_clients = vim.lsp.get_clients()
    local messages_map = {}
    for _, climsg in ipairs(client_messages) do
      messages_map[climsg.name] = climsg.body
    end

    if #lsp_clients > 0 then
      table.sort(lsp_clients, function(a, b)
        return a.name < b.name
      end)
      local builder = {}
      for _, cli in ipairs(lsp_clients) do
        if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
          if messages_map[cli.name] then
            table.insert(builder, stringify(cli.name, messages_map[cli.name]))
          else
            table.insert(builder, stringify(cli.name))
          end
        end
      end
      if #builder > 0 then
        return sign .. " " .. table.concat(builder, ", ")
      end
    end
    return ""
  end,
})

lualine.setup({
  options = {
    theme = "auto",
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    component_separators = "",
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", { "diagnostics", sections = { "error", "warn" } } },
    lualine_c = {},
    lualine_x = {
      function()
        return require("lsp-progress").progress()
      end,
    },
    lualine_y = {
      "grapple",
      {
        "filename",
        file_status = true,
        newfile_status = true,
        path = 4,
      },
    },
    lualine_z = { "progress", "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})
