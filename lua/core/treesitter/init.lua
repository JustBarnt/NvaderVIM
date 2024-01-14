local M = {}

-- TODO: Move to user config

M.Highlight = {
  enable = true,

  disable = function(lang, buf)
    local max_filesize = 1024 * 1024
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    local line_count = vim.api.nvim_buf_line_count(buf)
    if ok and stats and stats.size > max_filesize or ok and stats and line_count > 3000 then
      return true
    end
  end,
  additional_vim_regex_highlighting = false,
}

M.Refactor = {
  highlight_definitions = {
    enable = true,
    disable = { "xml" },
    clear_on_cursor_move = true
  },

  highlight_current_scope = { enable = false },

  smart_rename = {
    keymaps = {
      smart_rename = "<leader>cR",
    },
  },

  navigation = false,
}

M.Textobjects = {

}

return M
