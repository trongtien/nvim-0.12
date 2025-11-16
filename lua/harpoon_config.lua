local ok, harpoon = pcall(require, "harpoon")
if not ok then
	vim.notify("Harpoon not installed", vim.log.levels.WARN)
	return
end

harpoon:setup({})

local function generate_harpoon_picker()
	local file_paths = {}
	for _, item in ipairs(harpoon:list().items) do
		table.insert(file_paths, {
			text = item.value,
			file = item.value,
		})
	end
	return file_paths
end

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>fh", function()
	Snacks.picker({
		finder = generate_harpoon_picker,
		win = {
			input = {
				keys = {
					["dd"] = { "harpoon_delete", mode = { "n", "x" } },
				},
			},
			list = {
				keys = {
					["dd"] = { "harpoon_delete", mode = { "n", "x" } },
				},
			},
		},
		actions = {
			harpoon_delete = function(picker, item)
				local to_remove = item or picker:selected()
				table.remove(harpoon:list().items, to_remove.idx)
				picker:find({
					refresh = true, -- refresh picker after removing values
				})
			end,
		},
	})
end)
