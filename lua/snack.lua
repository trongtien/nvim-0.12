-- lazy load
vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("SnacksConfig", { clear = true }),
	pattern = "*",
	once = true,
	callback = function()
		local get_custom_layout = function(height)
			---@type snacks.picker.layout.Config
			return {
				reverse = true,

				layout = {
					box = "vertical",
					backdrop = false,
					row = -1,
					width = 0,
					height = height or 0.4,
					border = "none",
					{
						win = "list",
						title = "{title}",
						title_pos = "center",
						border = "rounded",
						-- Bỏ preview để tiết kiệm RAM
					},
					{ win = "input", height = 1, border = "none" },
				},
			}
		end

		require("snacks").setup({
			notifier = {
				top_down = false,
				style = "minimal",
				timeout = 2000, -- Giảm timeout
			},
			lazygit = { enabled = false }, -- Disable nếu không dùng
			terminal = { enabled = false }, -- Disable nếu không dùng
			picker = {
				win = {
					input = {
						keys = {
							["p"] = { "focus_preview", mode = { "n", "x" } },
						},
					},
				},
				matcher = {
					frecency = false, -- Tắt frecency để giảm RAM
				},
				layout = "custom",
				layouts = {
					custom = get_custom_layout(),
					select = {
						hidden = { "preview" },
						layout = get_custom_layout().layout,
					},
				},
			},
		})
	end,
})
