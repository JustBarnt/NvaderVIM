return {
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		config = function()
			require("user.plugins.completion")
		end,
		dependencies = {
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
		},
	},
    --[[ {
      "hrsh7th/cmp-cmdline",
      event = { "InsertEnter", "CmdlineEnter" },
      dependencies = {
          "hrsh7th/nvim-cmp",
      }
    }, ]]
	{ "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
}
