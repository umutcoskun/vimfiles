" html.vim
setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2

" Turn HTML tags and attributes to lowercase.
command! HTMLToLower %s/<\([^>]*\)>/<\L\1>/g
