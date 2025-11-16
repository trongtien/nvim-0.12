require("conform").setup({
	format_on_save = function(bufnr)
		local max_filesize = 50 * 1024
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
		if ok and stats and stats.size > max_filesize then
			return nil
		end
		return {
			timeout_ms = 3000, -- Giảm timeout
			lsp_format = "fallback",
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		graphql = { "prettierd", "prettier", stop_after_first = true },
		sql = { "sql_formatter" },
		go = { "goimports", "gofmt" },
	},
})
