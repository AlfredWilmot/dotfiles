" Prerequisites for using plugins
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'
" mitigates excessive folds
	Plugin 'tmhedberg/SimpylFold'
" Ensures indentation conforms to PEP-8
	Plugin 'vim-scripts/indentpython.vim'
" Auto-completion
" (https://github.com/ycm-core/YouCompleteMe#installation)
	Bundle 'Valloric/YouCompleteMe'
" Syntax-checking
	Plugin 'vim-syntastic/syntastic'
" Checks Python code conforms to PEP-8
	Plugin 'nvie/vim-flake8'
"" fuzzy file-finder
        Plugin 'junegunn/fzf.vim'
        Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
"" rip-grep keyword search
	Plugin 'mileszs/ack.vim'
call vundle#end()

" another vague requirement
filetype plugin indent on
