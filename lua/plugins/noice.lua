return {
	"folke/noice.nvim",
	event = { "VeryLazy" },
	dependencies = {
        { "MunifTanjim/nui.nvim" },
	},
	config = function()
		require("user.plugins.noice").setup()
	end,
}
