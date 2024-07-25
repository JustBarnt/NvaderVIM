return {
  "numToStr/Comment.nvim",
  event = "BufReadPre",
  keys = {
    { "gc", mode = { "n", "v" }, desc = "Toggle Comment Line Wise" },
    { "gb", mode = { "n", "v" }, desc = "Toggle Comment Block Wise" },
  },
  opts = function()
    local commentstring_avail, comment_string = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    return commentstring_avail and comment_string and { pre_hook = comment_string.create_pre_hook() } or {}
  end,
}
