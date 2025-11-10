vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
})

vim.cmd([[
	hi Normal guibg=NONE ctermbg=NONE
	hi NormalNC guibg=NONE ctermbg=NONE
	hi NormalFloat guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi StatusLine guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
]])

require("nightfox").setup({
	options = {
		priority = 1000,
		transparent = true,
		terminal_colors = true,
		styles = {
			keywords = "bold",
			functions = "bold",
			variables = "NONE",
		},
	},
})

-- vim.cmd("colorscheme vague")

vim.cmd("colorscheme duskfox")
