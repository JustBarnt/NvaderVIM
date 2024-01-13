local M = {}

M.pomodoro_component = function()
  local pomodoro = require "pomo"

  local timer = pomodoro.get_first_to_finish()

  if timer == nil then
    return "󰄉"
  end

  return "󰄉 " .. tostring(timer)
end

M.trunc = function(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ""
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
    end
    return str
  end
end

return M
