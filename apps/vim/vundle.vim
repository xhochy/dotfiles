""" Vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'
Bundle 'w0ng/vim-hybrid'
Bundle 'tpope/vim-fugitive'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Bundle 'rosstimson/scala-vim-support'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-git'
Bundle 'acustodioo/vim-tmux'
Bundle 'jnwhiteh/vim-golang'
Bundle 'vim-scripts/VimClojure'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-scripts/octave.vim--'
Bundle 'vim-scripts/IndentAnything'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'kien/ctrlp.vim'
Bundle 'petRUShka/vim-opencl'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'JuliaLang/julia-vim'
Bundle 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
