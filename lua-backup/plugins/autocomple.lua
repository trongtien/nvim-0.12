vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	signature = { enabled = true },
	keymap = {
		preset = "default",
		["<Tab>"] = { "select_and_accept", "fallback" },
		["<C-space>"] = { "select_and_accept", "fallback" },
		["<C-n>"] = { "select_next", "show", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-j>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 100,
		},
	},

	cmdline = {
		keymap = {
			preset = "inherit",
			["<Tab>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
