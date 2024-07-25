return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "keyvchan/telescope-find-pickers.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
  },
  keys = function()
    local builtin = require("telescope.builtin")
    local telescope_utils = require("core.utils.telescope")
    local keys = {
      { "<leader>sb", "<CMD>Telescope file_browser<CR>", desc = "Telescope File Browser" },
      { "<leader>.", "<CMD>Telescope find_pickers<CR>", desc = "Search Telescope Pickers" },
      { "<leader><leader>", "<CMD>Telescope buffers<CR>", desc = "Search Buffers" },
      { "<leader>/", "<CMD>Telescope live_grep_args<CR>", desc = "Grep Project" },
      { "<leader>sf", "<CMD>Telescope find_files<CR>", desc = "Search Files" },
      { "<leader>sh", "<CMD>Telescope help_tags<CR>", desc = "Search Help" },
      { "<leader>sw", telescope_utils.search_word_in_project, desc = "Search Word in Project" },
      { "<leader>sW", telescope_utils.search_string_in_project, desc = "Search String in Project" },
      { "<leader>sp", telescope_utils.search_in_project, desc = "Search by Grep" },
      { "<leader>s/", telescope_utils.search_open_files_for_word, desc = "Search Open Files for Word" },
      {
        "<leader>sn",
        function()
          builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Files Neovim Config",
      },
    }
    return keys
  end,
  opts = function()
    local layouts = require("core.utils.telescope")
    local telescope = require("telescope")
    local telescope_extensions = { "workspaces", "live_grep_args", "hbac", "find_pickers", "file_browser", "grapple" }

    local opts = {
      defaults = layouts.telescope_defaults,
      extensions = {
        live_grep_args = layouts.vertical_layouts.live_grep_args,
        file_browser = layouts.vertical_layouts.file_browser,
      },
      pickers = {
        find_files = layouts.vertical_layouts.find_files,
        buffers = layouts.vertical_layouts.buffers,
        highlights = layouts.vertical_layouts.highlights,
        grep_string = layouts.vertical_layouts.default,
        current_buffer_fuzzy_find = layouts.vertical_layouts.default,
        help_tags = layouts.vertical_layouts.help_tags,
      },
    }

    for i = 1, #telescope_extensions do
      pcall(telescope.load_extension, telescope_extensions[i])
    end
    return opts
  end,
}
