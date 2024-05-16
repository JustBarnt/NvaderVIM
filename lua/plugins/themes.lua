local utils = require("core.utils")

return {
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("oldworld").setup(opts)
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = true,
      terminal_colors = true,
    },
    config = function(_, opts)
      require("cyberdream").setup(utils.create_spec("cyberdark", opts))
    end,
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    name = "rose-pine",
    lazy = false,
    opts = {
      bold_vert_split = true,
      extend_background_behind_borders = false,
      disable_background = true,
      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },
      highlight_groups = require("core.ui.rose-pine").borderless_telescope(),
    },
    config = function(_, opts)
      require("rose-pine").setup(utils.create_spec("rose_pine", opts))
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      styles = {
        functions = { bold = true },
        keywords = { bold = true },
        -- floats = "transparent",
      },
      on_highlights = function(hl, c)
        local highlight_overrides = require("core.ui.tokyonight")
        highlight_overrides.overrides(hl, c)
      end,
      on_colors = function(_) end,
    },
    config = function(_, opts)
      require("tokyonight").setup(utils.create_spec("tokyonight", opts))
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    config = function(_, opts)
      require("tokyodark").setup(utils.create_spec("tokyodark", opts))
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      overrides = function(colors)
        local overrides = require("core.ui.kanagawa")
        return vim.tbl_deep_extend(
          "force",
          {},
          overrides.borderless_float(colors),
          overrides.borderless_telescope(colors)
        )
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(utils.create_spec("kanagawa", opts))
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = {
        sidebars = true,
      },
    },
    config = function(_, opts)
      require("material").setup(utils.create_spec("material", opts))
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    config = function(_, opts)
      require("nordic").setup(utils.create_spec("nordic", opts))
    end,
  },
  {
    "AstroNvim/astrotheme",
    dependencies = {
      "AstroNvim/astroui",
      lazy = false, -- disable lazy loading
      priority = 10000, -- load AstroUI first
      opts = {
        -- set configuration options  as described below
      },
    },
    lazy = false, -- disable lazy loading
    priority = 10000, -- load AstroUI first
    opts = {
      -- set configuration options  as described below
    },
  },
}
