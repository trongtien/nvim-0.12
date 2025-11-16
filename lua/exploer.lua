require("oil").setup({
	win_options = {
		signcolumn = "no", -- Tắt signcolumn để tiết kiệm RAM
	},
	view_options = {
		show_hidden = true,
	},
})

require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
	renderer = {
		icons = {
			git_placement = "signcolumn",
			glyphs = {
				git = {
					unstaged = "U",
					staged = "S",
					unmerged = "UM",
					renamed = "R",
					deleted = "D",
					untracked = "UT",
					ignored = "I",
				},
			},
		},
	},
})
