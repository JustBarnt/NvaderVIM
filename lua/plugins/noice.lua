return {
	"folke/noice.nvim",
	event = { "VeryLazy" },
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{
			"rcarriga/nvim-notify",
			config = function()
				require("user.plugins.notify").setup()
			end,
		},
	},
	config = function()
		require("user.plugins.noice").setup()
	end,
}
