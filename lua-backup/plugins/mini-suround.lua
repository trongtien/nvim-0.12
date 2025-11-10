vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.surround.nvim" },
})

require("mini.surround").setup({
	opts = {
		mappings = {
			add = "<leader>sa",
			delete = "<leader>sd",
			find = "gsf",
			find_left = "gsF",
			highlight = "gsh",
			replace = "gsr",
			update_n_lines = "gsn",
		},
	},
})
