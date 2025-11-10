require("oil").setup({
	lsp_file_methods = {
		enabled = true,
		timeout_ms = 1000,
		autosave_changes = true,
	},
	columns = {
		"permissions",
		"icon",
	},
	float = {
		max_width = 0.7,
		max_height = 0.6,
		border = "rounded",
	},
})

vim.cmd([[
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv(0)) && !exists('s:std_in') | exe 'NERDTree' argv(0) | wincmd p | endif
]])

-- Quit Neovim if NERDTree is the only window left
vim.cmd([[
  autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])

vim.cmd([[
  augroup NERDTreeCustomKeys
    autocmd!
    autocmd FileType nerdtree call s:NERDTreeMappings()
  augroup END

  function! s:NERDTreeMappings() abort
    " w để mở/đóng thư mục
    nmap <buffer> l o
  endfunction
]])
