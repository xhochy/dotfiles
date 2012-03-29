" From: http://blog.hellyna.com/2010/12/auto-stripping-of-trailing-whitespace.html
" automatically remove trailing whitespace before write
function! StripTrailingWhitespace()
    normal mZ
    %s/\s\+$//e
    if line("'Z") != line(".")
        echo "Stripped whitespace\n"
    endif
    normal `Z
endfunction
autocmd BufWritePre COMMIT_EDITMSG,.vimrc,*.js,*.pp,*.hpp,*.i,*.c,*.py,*.sh,*.html :call StripTrailingWhitespace()

" hightlight extra whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/

