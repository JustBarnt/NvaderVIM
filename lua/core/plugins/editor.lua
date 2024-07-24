return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.edgy")
    end,
  },
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    opts = {
      autoclose = true,
      threshold = 5,
    },
    config = function()
      require("core.plugins.configs.hbac")
    end,
  },
  {
    "famiu/bufdelete.nvim",
    event = "VeryLazy",
  },
  {
    "Bekaboo/deadcolumn.nvim",
    event = "BufReadPre",
  },
  {
    "backdround/global-note.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gn", "<CMD>GlobalNote<CR>", desc = "Open Global Note Pad" },
    },
    config = function()
      require("core.plugins.configs.global-note")
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.ccc")
    end,
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "keyvchan/telescope-find-pickers.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0" },
    },
    config = function()
      require("core.plugins.configs.telescope")
    end,
  },
  {
    "nacro90/numb.nvim",
    event = "BufEnter",
    config = true,
  },
  {
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
      },
    },
    config = function()
      require("core.plugins.configs.grapple")
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("core.plugins.configs.grug-far")
    end,
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = "VeryLazy",
    config = function()
      require("core.plugins.configs.nvim-toggler")
    end,
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          override = function(conf)
            conf.col = -1
            conf.row = 0
            return conf
          end,
        },
        select = {
          get_config = function(opts)
            local themes = require("telescope.themes")
            local sorters = require("telescope.sorters")
            if opts.kind == "legendary.nvim" then
              return {
                telescope = themes.get_dropdown({
                  sorter = sorters.fuzzy_with_index_bias({}),
                }),
              }
            else
              return {
                telescope = themes.get_dropdown({}),
              }
            end
          end,
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    config = function()
      require("core.plugins.configs.markdown")
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        background_colour = "NotifyBackground",
        fps = 60,
        render = "wrapped-compact",
        stages = "static",
        timeout = 3000,
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    config = function(_, opts)
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icons",
          "size",
          "permissions",
          "mtime",
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
      require("core.utils").map("n", "-", "<CMD>Oil<CR>", { desc = "Open Directory" })
      require("core.utils").map("n", "<leader>de", "<CMD>Oil --float<CR>", { desc = "Open Directory in Float" })
    end,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>xx", "<CMD>Trouble<CR>", desc = "Trouble Toggle" },
      { "<leader>xd", "<CMD>Trouble diagnostics<CR>", desc = "Trouble Document Diagnostics" },
      { "<leader>xq", "<CMD>Trouble quickfix<CR>", desc = "Trouble Quick Fix" },
      { "<leader>xl", "<CMD>Trouble loclist<CR>", desc = "Trouble Local List" },
      {
        "<leader>o",
        "<CMD>Trouble symbols toggle pinned=false results.win.relative=true results.win.position=right<CR>",
        desc = "Document Sybmols (Trouble)",
      },
    },
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "mbbill/undotree",
    event = "BufReadPre",
    config = function()
      if vim.g.loaded_undotree == 1 then
        vim.g.undotree_WindowLayout = 2
        if vim.fn.has("win32") == 1 then
          vim.g.undotree_DiffCommand = "FC"
        end
      end
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {}, -- Empty opts means default options
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
    end,
  },
  {
    "natecraddock/workspaces.nvim",
    opts = {
      path = vim.fn.stdpath("data") .. "/workspaces",
      cd_type = "global",
      hooks = {
        add = {},
        remove = {},
        rename = {},
        open_pre = {},
        open = { "Telescope find_files" },
      },
    },
    keys = {
      { "<leader>sd", "<CMD>Telescope workspaces<CR>", { desc = "Search Workspaces" } },
    },
    config = function(_, opts)
      require("workspaces").setup(opts)
    end,
  },
}
