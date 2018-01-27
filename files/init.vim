" No tabs, please
set expandtab
set tabstop=4

" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'iCyMind/NeoSolarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
call plug#end()

" Colorscheme
set background=dark
set termguicolors
colorscheme NeoSolarized

" Ctrl+P
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

setl shiftwidth=2
au FileType cpp setl shiftwidth=2
au FileType python setl shiftwidth=4
au FileType javascript setl shiftwidth=2
au FileType vue setl shiftwidth=2
" Jenkinsfiles are groovy
au BufNewFile,BufRead Jenkinsfile setf groovy
