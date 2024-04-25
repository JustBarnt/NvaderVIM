local utils = require "core.utils"

return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    columns = {
      "icons",
      "size",
      "permissions",
      "mtime",
    },
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    experimental_watch_for_changes = true,
    is_always_hidden = function(name, bufnr)
      local ignore = { ".sveltekit", "build", "node_modules" }
      for i_name, _ in pairs(ignore) do
        if i_name == name then
          return true
        end
      end
      return false
    end,
  },
  config = function(_, opts)
    require("oil").setup(utils.create_spec("oil", opts))
    utils.map("n", "-", "<CMD>Oil<CR>", { desc = "Open Directory" })
    utils.map("n", "<leader>de", "<CMD>Oil --float", { desc = "Open Directory in Float" })
  end,
}
