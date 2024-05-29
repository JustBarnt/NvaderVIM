local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
  error("Failed to load Telescope", vim.log.levels.ERROR)
  return
end

local extensions = telescope.extensions
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local telescope_utils = require("core.utils.telescope")
local utils = require("core.utils")
local telescope_extensions = { "themes", "luasnip", "noice", "workspaces", "live_grep_args", "hbac" }

-- Create a re-usable function for Which-key to create
-- easy mappings that are already added to Which-key

utils.map("n", "<leader>sc", "<CMD>Telescope themes<CR>", { desc = "Search Colorschemes" })
utils.map("n", "<leader><leader>", builtin.buffers, { desc = "Search Buffers" })
utils.map("n", "<leader>/", extensions.live_grep_args.live_grep_args, { desc = "GRep Project" })
utils.map("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
utils.map("n", "<leader>sw", telescope_utils.search_word_in_project, { desc = "Search Word in Project" })
utils.map("n", "<leader>sW", telescope_utils.search_string_in_project, { desc = "Search String in Project" })
utils.map("n", "<leader>sp", telescope_utils.search_in_project, { desc = "Search by Grep" })
utils.map("n", "<leader>s/", telescope_utils.search_open_files_for_word, { desc = "Search Open Files for Word" })
utils.map("n", "<leader>vim", function()
  builtin.find_files { cwd = vim.fn.stdpath("config") }
end, { desc = "Find Files Neovim Config" })

telescope.setup {
  defaults = {
    layout_strategy = "vertical",
    sorting_strategy = "ascending",
    results_title = "",
    prompt_prefix = "  ",
    selection_caret = "  ",
    entry_prefix = "   ",
    layout_config = {
      prompt_position = "top",
    },
    get_status_text = function(picker)
      local total = picker.stats.processed or 0
      local matches = total - (picker.stats.filtered or 0)

      if matches == 0 and total == 0 then
        return ""
      end

      return string.format("%s|%s ", matches, total)
    end,
    path_display = { filename_first = { reverse_directories = false } },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    live_grep_args = {
      previewer = false,
      prompt_title = "Global Search (w/args)",
    },
    themes = {
      enable_live_preview = true,
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      persist = { enabled = true, path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua" },
    },
  },
  pickers = {
    buffers = {
      previewer = false,
      prompt_title = "Buffers",
      mappings = {
        i = { ["<c-d>"] = actions.delete_buffer },
        n = { ["d"] = actions.delete_buffer },
      },
    },
    find_files = {
      telescope_utils.select_find_command(),
      previewer = false,
    },
    git_commits = {
      previewer = false,
    },
    git_status = {
      previewer = false,
    },
    git_branches = {
      previewer = false,
    },
    current_buffer_fuzzy_find = {
      previewer = false,
    },
    help_tags = {
      prompt_title = "Search Help",
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "bottom",
      },
    },
  },
}

for i = 1, #telescope_extensions do
  pcall(telescope.load_extension, telescope_extensions[i])
end

local telescope_any_options = {
  pickers = {
    [""] = builtin.find_files,
    [":"] = builtin.current_buffer_fuzzy_find,
    ["/"] = extensions.live_grep_args.live_grep_args,
    ["q "] = builtin.quickfix,
    ["h "] = builtin.help_tags,
    ["b "] = builtin.buffers,
    ["au "] = builtin.autocommands,
    ["hi "] = builtin.highlights,
    ["gs "] = builtin.git_status,
    ["gb "] = builtin.git_branches,
    ["gc "] = builtin.git_commits,
    ["ws "] = extensions.workspaces.workspaces,
    ["sym "] = builtin.lsp_document_symbols,
    ["cmd "] = builtin.commands,
    ["noti "] = extensions.noice.noice,
    ["ctags "] = builtin.current_buffer_tags,
    ["keymaps "] = builtin.keymaps,
    ["options "] = builtin.vim_options,
  },
}

local telescope_any = require("telescope-any").create_telescope_any(telescope_any_options)
utils.map("n", "<leader><localleader>", "", {
  noremap = true,
  silent = true,
  callback = telescope_any,
  desc = "Telescope Command Palette",
})
