vim.g.neovide_scale_factor = 0.8
vim.g.neovide_refresh_rate = 60
vim.g.neovide_cursor_vfx_mode = "railgun"

vim.keymap.set("n", "<C-=>", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end)

vim.keymap.set("n", "<C-->", function()
	vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end)

vim.keymap.set("n", "<C-0>", function()
	vim.g.neovide_scale_factor = 1.0
end)

vim.keymap.set({ "n", "v", "i" }, "<C-S-V>", '"+p', { desc = "Paste từ clipboard" })

vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true
