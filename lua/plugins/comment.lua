-- lua/plugins/comment.lua

return {
	"numToStr/Comment.nvim",
	-- lazy.nvim will automatically call setup unless you provide a config function
	-- opts = {}, -- You can still pass options here
	keys = {
		{
			"<leader>/",
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			desc = "Toggle comment on current line",
		},
		{
			"<leader>/",
			mode = "v", -- visual mode
			function()
				-- The '<,'> is a range specifier for visual mode
				require("Comment.api").toggle.linewise(vim.fn.visualmode())
			end,
			desc = "Toggle comment on selection",
		},
	},
}
