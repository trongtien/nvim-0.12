vim.pack.add({
	{ src = "https://github.com/preservim/nerdtree" },
})

vim.keymap.set("n", "<C-b>", ":NERDTreeToggle<CR>", { silent = true, desc = "Toggle NERDTree" })

-- Start NERDTree automatically when Neovim opens a directory
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
