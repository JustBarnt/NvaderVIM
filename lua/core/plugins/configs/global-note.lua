local has_note, note = pcall(require, "global-note")

if not has_note then
  error("Failed to load global-note")
  return
end

note.setup({
  filename = "global.md",
  directory = vim.fn.stdpath("data") .. "/global-note/",
  title = "Todo: ",
  command_name = "GlobalNote",
  window_config = function()
    local window_height = vim.api.nvim_list_uis()[1].height
    local window_width = vim.api.nvim_list_uis()[1].width
    return {
      relative = "editor",
      border = "single",
      title = "Note",
      title_pos = "center",
      width = math.floor(0.7 * window_width),
      height = math.floor(0.85 * window_height),
      row = math.floor(0.05 * window_height),
      col = math.floor(0.15 * window_width),
    }
  end,
  -- Additional presets to create other global, project local, file local
  -- and other notes.
  -- { [name]: table } - tables there have the same fields as the current table.
  additional_presets = {},
})
