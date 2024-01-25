local function toggle_telescope(harpoon_files)
  local conf = require("telescope.config").values
  local file_paths = {}
  for i, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, {index=i, entry=item})
  end


  require("telescope.pickers").new({initial_mode='normal'}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    entry_maker = function(tbl)
      local rrr = {
        value = tbl.entry,
        display = tbl.entry.value,
        ordinal = tostring(tbl.index),
        path = tbl.entry.value, -- must add 'path' so that file_previewer works.
      }
      return rrr
    end,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      map('n', 'dd', function(_p_bufnr)
        local action_state = require("telescope.actions.state")
        local entry = action_state.get_selected_entry()
        local h = require('harpoon')
        local l = h:list():removeAt(entry.index)
        require("telescope.actions").close(_p_bufnr)
      end)
      return true
    end,
  }):find()
end
