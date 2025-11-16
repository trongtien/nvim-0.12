local km = vim.keymap.set
local silent = { silent = false }
local opts = { noremap = true, silent = true }
local oil = require("oil")
local Snacks = require("snacks")

-- Copy pass text to clipoare
km("v", "<C-c>", '"+y', opts)
km("i", "<C-v>", "<C-r>+", opts)
km("c", "<C-v>", "<C-r>+", opts)
km("n", "<C-v>", '"+p', opts)

km("n", "<Leader>q", "<Cmd>:quit<CR>")
km("n", "<leader>Q", "<Cmd>:wqa<CR>", { desc = "Quit the current buffer." })

km("n", "<leader>w", "<Cmd>:w<CR>", silent)
km("i", "jk", "<Esc>")
km("i", "jw", "<Esc>:w<CR>")

km("n", "sv", ":vsplit<CR>")
km("n", "sh", ":sview<CR>")

-- Resize
km("n", "=", "<cmd>resize +2<CR>")
km("n", "-", "<cmd>resize -2<CR>")
km("n", "]", "<cmd>vertical resize +5<CR>")
km("n", "[", "<cmd>vertical resize -5<CR>")

-- Git
km("n", "<leader>gs", "<cmd>Git<CR>", opts)
km("n", "<leader>gp", "<cmd>Git push<CR>", opts)

-- Move between windows with Ctrl+hjkl (like tmux)
km("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
km("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
km("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
km("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- ═══════════════════════════════════════════════════════════
-- SMART TEXT EDITING
-- ═══════════════════════════════════════════════════════════

-- Better indenting (stay in visual mode)
km("v", "<", "<gv")
km("v", ">", ">gv")

km("n", "<leader>e", ":Oil<CR>")
km("n", "<leader>E", oil.open_float)
km("n", "<C-b>", "<cmd>NvimTreeToggle<cr>")

-- Better paste (doesn't replace clipboard with deleted text)
km("v", "p", '"_dP', opts)
-- Copy whole file to clipboard
km("n", "<C-c>", ":%y+<CR>", opts)

-- Auto-close pairs (simple, no plugin needed)
km("i", "`", "``<left>")
km("i", '"', '""<left>')
km("i", "(", "()<left>")
km("i", "[", "[]<left>")
km("i", "{", "{}<left>")
km("i", "<", "<><left>")

-- Move Lines
km("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
km("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
km("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
km("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

km("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Search file using snack
km("n", "<leader>ff", function()
	Snacks.picker.files({ hidden = true })
end)

km("n", "<leader>fb", function()
	Snacks.picker.buffers()
end)

km("n", "<leader>fs", function()
	Snacks.picker.smart({ hidden = true })
end)

km("n", "<leader>fg", function()
	Snacks.picker.grep({ hidden = true })
end)

km("n", "<leader>fh", function()
	Snacks.picker.help()
end)

km("n", "<leader>gi", function()
	Snacks.picker.gh_issue()
end)

km("n", "<leader>gI", function()
	Snacks.picker.gh_issue({ state = "all" })
end)

km("n", "<leader>gp", function()
	Snacks.picker.gh_pr()
end)

km("n", "<leader>sq", function()
	Snacks.picker.qflist()
end)

km("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end)

km("n", "<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end)
