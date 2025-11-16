local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local map = vim.keymap.set
local bs = { buffer = true, silent = true }
local brs = { buffer = true, remap = true, silent = true }

-- Highlight yanked text
local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
})

autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf

		-- Keybindings for LSP features
		map("n", "<leader>re", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

		map("n", "gd", vim.lsp.buf.definition, bs)
		map("n", "gD", vim.lsp.buf.declaration, bs)
		map("n", "gr", vim.lsp.buf.references, bs)
		map("n", "gi", vim.lsp.buf.implementation, bs)
		map("n", "<leader>ca", vim.lsp.buf.code_action, bs)
		map("n", "<leader>rn", vim.lsp.buf.rename, bs)
		map("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, bs)
		map("n", "K", vim.lsp.buf.hover, bs)

		vim.api.nvim_buf_create_user_command(buf, "LspCodeAction", function()
			vim.lsp.buf.code_action()
		end, { desc = "LSP Code Action" })
	end,
})

autocmd("FileType", {
	pattern = "netrw",
	callback = function()
		map("n", "<C-c>", "<cmd>bd<CR>", bs)
		map("n", "<Tab>", "mf", brs)
		map("n", "<S-Tab>", "mF", brs)
		map("n", "%", function()
			local dir = vim.b.netrw_curdir or vim.fn.expand("%:p:h")
			vim.ui.input({ prompt = "Enter filename: " }, function(input)
				if input and input ~= "" then
					local filepath = dir .. "/" .. input
					vim.cmd("!touch " .. vim.fn.shellescape(filepath))
					vim.api.nvim_feedkeys("<C-l>", "n", false)
				end
			end)
		end, bs)
	end,
})

autocmd("FileType", {
	pattern = "*",
	callback = function(ev)
		local ft = vim.bo[ev.buf].filetype
		local formatting = "lua vim.lsp.buf.format()"

		if ft == "lua" then
			formatting = "!stylua %"
		elseif ft == "tex" then
			formatting = "!latexindent -s -l -w %"
		elseif ft == "python" then
			formatting = "!black %"
		end

		local cmd = function()
			vim.cmd("write")
			vim.cmd("silent " .. formatting)
		end

		map("n", "<leader>fo", cmd, { buffer = ev.buf })
	end,
})
