return {
  "cbochs/grapple.nvim",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "Grapple" },
  keys = {
    { "<leader>ha", "<CMD>Grapple toggle<CR>", desc = "Tag Current File" },
    { "<leader>he", "<CMD>Grapple toggle_tags<CR>", desc = "Toggle Tags Menu" },
    { "<leader>1", "<CMD>Grapple select index=1<CR>", desc = "Select Tag 1" },
    { "<leader>2", "<CMD>Grapple select index=2<CR>", desc = "Select Tag 2" },
    { "<leader>3", "<CMD>Grapple select index=3<CR>", desc = "Select Tag 3" },
    { "<leader>4", "<CMD>Grapple select index=4<CR>", desc = "Select Tag 4" },
    { "<leader>hn", "<CMD>Grapple cycle_tags next<CR>", desc = "Go-To Next Tag" },
    { "<leader>hp", "<CMD>Grapple cycle_tags prev<CR>", desc = "Go-To Previous Tag" },
  },
  dependencies = {
    {
      "cbochs/portal.nvim",
      cmd = { "Portal" },
      keys = {
        { "<leader>Hn", "<CMD>Portal grapple forward<CR>", desc = "Portal Grapple Next" },
        { "<leader>Hp", "<CMD>Portal grapple backward<CR>", desc = "Portal Grapple Next" },
      },
      opts = {
        window_options = {
          width = 50,
          height = 5,
          border = "rounded",
        },
      },
    },
  },
  opts = {
    scope = "cwd",
    win_opts = {
      width = 0.5,
      height = 0.25,
      border = "rounded",
    },
    statusline = {
      icon = "",
      active = "[%s]",
      inactive = " %s ",
    },
  },
}
