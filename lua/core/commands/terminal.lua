local api = vim.api

api.nvim_create_user_command("Terminal", function()
  vim.cmd("botright terminal")

  local buf_opts = {
    filetype = "terminal",
    buf_name = "Terminal",
  }

  local bufnr = api.nvim_get_current_buf()
  api.nvim_set_option_value("filetype", buf_opts.filetype, { buf = bufnr })
end, { bang = false })
