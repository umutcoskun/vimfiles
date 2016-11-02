" python.vim

" Remove trailing whitespaces when saved.
autocmd BufWritePre *.py :%s/\s\+$//e

" Disable docstring popup during completion.
setlocal completeopt-=preview

" Run current buffer via python3.
nnoremap <leader>r :!python3 %<CR>
