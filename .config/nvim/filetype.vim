augroup filetypedetect
"au BufNewFile,BufRead *.moin setf moin
"au BufNewFile,BufRead *.wiki setf moin
"au BufNewFile,BufRead *.tiddlywiki setf tiddlywiki
"autocmd BufNewFile,BufRead *.markdown,*.md,*.mdown,*.mkd,*.mkdn setf zelhar
" Mail
autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

