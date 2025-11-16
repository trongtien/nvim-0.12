require("config")
require("source")
require("lsp")

require("autocomplete")
require("autocmds")

--@type config plugins
require("exploer")
require("lualine")
require("snack")
require("formater")
require("map")
require("diagnostics")

--@type config color theme
local color_vague = require("vague")
color_vague.setup({
	disable_background = true,
	styles = {
		italic = false,
	},
})
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd("colorscheme vague")

if vim.g.neovide then
	require("neovide")
end
