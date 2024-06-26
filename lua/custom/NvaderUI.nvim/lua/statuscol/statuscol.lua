local statuscolumn = {}
statuscolumn.buffer_configs = {}

statuscolumn.setHl = function()
  --TODO: Create a Dim/Brighten function and set it to a default Highlight namespace instead of hardcoding the hexes
  local colors = { "#caa6f7", "#c1a6f1", "#b9a5ea", "#b1a4e4", "#aba3dc", "#a5a2d4", "#9fa0cc", "#9b9ec4", "#979cbc", "#949ab3" }

  for i, color in ipairs(colors) do
    vim.api.nvim_set_hl(0, "Gradient_" .. i, { fg = color })
  end
end

statuscolumn.gap = function(gap_config)
  local string = ""
  string = string .. gap_config.style
  return string
end

statuscolumn.border = function(border_config)
  local string = ""

  if vim.v.relnum < 9 then
    string = string .. "%#Gradient_" .. (vim.v.lnum + 1) .. "#" .. border_config.style
  else
    string = string .. "%#Gradient_10#" .. border_config.style
  end

  return string
end

statuscolumn.number = function(num_config)
  local text = ""
  local merged_config = vim.tbl_extend("keep", num_config or {}, {
    colors = nil,
    type = "normal",
  })

  if merged_config.colors ~= nil and vim.islist(num_config.colors) == true then
    for rel_num, hl in ipairs(merged_config.colors) do
      if vim.v.relnum + 1 == rel_num then
        text = "%#" .. hl .. "#"
        break
      end
    end

    if text == "" then
      text = "%#" .. num_config.colors[#num_config.colors] .. "#"
    end
  end

  if num_config.type == "normal" then
    return text .. vim.v.lnum
  elseif num_config.type == "relative" then
    return text .. vim.v.relnum
  elseif num_config.type == "hybrid" then
    return vim.v.relnum == 0 and text .. vim.v.lnum or text .. vim.v.relnum
  end

  return text
end

--- Statuscol startup process
--- @param buffer number Buffer handle
--- @param config table Status column config
statuscolumn.init = function(buffer, config)
  if config == nil then
    statuscolumn.buffer_configs[buffer] = false
  elseif config.enabled then
    statuscolumn.buffer_configs[buffer] = {}
  else
    statuscolumn.buffer_configs[buffer] = config.components
  end

  local windows = vim.fn.win_findbuf(buffer)

  if statuscolumn.buffer_configs[buffer] == false then
    for _, window in ipairs(windows) do
      vim.wo[window].statuscolumn = ""
    end
  else
    for _, window in ipairs(windows) do
      if config ~= nil and config.components ~= nil and config.setup_defaults == true then
        vim.wo[window].relativenumber = true
        vim.wo[window].foldcolumn = "0"
        vim.wo[window].signcolumn = "no"
        vim.wo[window].numberwidth = 1
      end

      vim.wo[window].statuscolumn = "%!v:lua.require('statuscol.statuscol').build_statuscol(" .. buffer .. ")"
    end
  end
end

statuscolumn.build_statuscol = function(buffer)
  local ret = ""

  local opts = statuscolumn.buffer_configs[buffer]

  if opts == nil then
    return ret
  end

  for _, component in ipairs(opts.components or {}) do
    if component.name == "gap" then
      ret = ret .. statuscolumn.gap(component)
    elseif component.name == "border" then
      ret = ret .. statuscolumn.border(component)
    elseif component.name == "number" then
      ret = ret .. statuscolumn.number(component)
    end
  end
end

return statuscolumn
