return {
  "stevearc/oil.nvim",
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  config = function()
    local map = require("core.utils").map
    map("n", "-", "<CMD>Oil<CR>", { desc = "Open Directory" })
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icons",
      },
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      watch_for_changes = true,
      view_options = {
        is_always_hidden = function(name, bufnr)
          local ignore = { ".sveltekit", "build", "node_modules" }
          for _, i_name in pairs(ignore) do
            if i_name == name then
              return true
            end
          end
          return false
        end,
      },
    })
  end,
}
