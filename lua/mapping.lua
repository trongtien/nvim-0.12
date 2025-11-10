local map = vim.keymap.set

-- split pannel
map("n", "sv", ":vsplit<CR>")
map("n", "sh", ":sview<CR>")

-- Normal Mapping
map("n", "<c-h>", "<c-w>h")
map("n", "<c-l>", "<c-w>l")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<ESC><ESC>", ":nohlsearch<CR>")

map("i", "jk", "<Esc>")
map("i", "ww", "<Esc>:w<CR>")

map("n", ";", ":", {
	silent = false,
	nowait = true,
})

map("n", "<leader>w", "<Cmd>:w<CR>", { silent = false })
map("n", "<Leader>q", "<Cmd>:quit<CR>")
map("n", "<leader>Q", "<Cmd>:wqa<CR>", { desc = "Quit the current buffer." })
map("n", "<leader>bd", require("mini.bufremove").delete)

map({ "n", "x" }, "<leader>y", '"+y')
map({ "n", "x" }, "<leader>d", '"+d')
map("n", "<leader>p", '"_dP')

map("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Key config tab
map("n", "<Leader>t", "<Cmd>tabnew<CR>")
map("n", "<S-H>", ":bnext<CR>", { silent = false })
map("n", "<S-L>", ":bprevious<CR>", { silent = false })

map("n", "<C-b>", ":NERDTreeToggle<CR>", { silent = true, desc = "Toggle NERDTree" })
map("n", "F", ":NERDTreeFind<CR>", { silent = true, desc = "Find NERDTree" })

map("n", "<leader>e", "<cmd>Oil<CR>")
map("n", "<leader>E", require("oil").open_float)

map("n", "<C-q>", ":copen<CR>", { silent = true })
for i = 1, 9 do
	map("n", "<leader>" .. i, ":cc" .. i .. "<CR>", { noremap = true, silent = true })
end

-- Resize
map("n", "=", "<cmd>resize +2<CR>")
map("n", "-", "<cmd>resize -2<CR>")
map("n", "]", "<cmd>vertical resize +5<CR>")
map("n", "[>", "<cmd>vertical resize -5<CR>")

-- Go to error
vim.keymap.set("n", "<leader>]e", vim.diagnostic.goto_next) -- next err
vim.keymap.set("n", "<leader>[e", vim.diagnostic.goto_prev) -- previous err
vim.keymap.set("n", "<leader>re", vim.diagnostic.open_float)

-- Setting lsp
map("i", "<c-n>", function()
	vim.lsp.completion.get()
end)
map("n", "K", vim.lsp.buf.hover, {})
map("n", "gi", vim.lsp.buf.implementation, {})
map("n", "gd", vim.lsp.buf.definition, {})
map("n", "gD", vim.lsp.buf.declaration, {})
map("n", "gr", vim.lsp.buf.references, {})
map("n", "<leader>rn", vim.lsp.buf.rename, {})
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
map("n", "<leader>gf", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Format code (LSP)" })

-- Search
map("n", "<leader>fg", "<Cmd>Pick grep_live<CR>")
map("n", "<leader>ff", "<Cmd>Pick files<CR>")
map("n", "<leader>fb", "<Cmd>Pick buffers<CR>")
