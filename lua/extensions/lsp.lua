local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.config['lua_ls'] = {
	cmd = { "lua-language-server" },
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
vim.lsp.config['ts_ls'] = {
	capabilities = capabilities,
}

vim.lsp.config['eslint'] = {
	capabilities = capabilities,
}

vim.lsp.config['zls'] = {
	capabilities = capabilities,
}

vim.lsp.config['yamlls'] = {
	capabilities = capabilities,
}

vim.lsp.config['tailwindcss'] = {
	capabilities = capabilities,
}

-- protocol buffer
vim.lsp.config['buf_ls'] = {
	capabilities = capabilities,
}

-- docker compose
vim.lsp.config['docker_compose_language_service'] = {
	capabilities = capabilities,
}

-- svelte
vim.lsp.config['svelte'] = {
	capabilities = capabilities,
}
-- python
vim.lsp.config['pyright'] = {
	capabilities = capabilities,
}

-- bash
vim.lsp.config['bashls'] = {
	capabilities = capabilities,
}

-- protocol buffer (kích hoạt riêng theo filetype)
vim.lsp.config['buf_language_server'] = {
	capabilities = capabilities,
}

vim.lsp.enable({
	"lua_ls",
	"cssls",
	"svelte",
	"tinymist",
	"svelteserver",
	"rust_analyzer",
	"clangd",
	"ruff",
	"glsl_analyzer",
	"hlint",
	"intelephense",
	"biome",
	"tailwindcss",
	"ts_ls",
	"emmet_language_server",
	"emmet_ls",
	"docker_compose_language_service"
})


vim.cmd [[set completeopt+=menuone,noselect,popup]]
vim.api.nvim_create_autocmd("FileType", {
	pattern = "proto",
	callback = function()
		vim.lsp.enable('buf_language_server')
	end,
})

-- Cmd Config
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
