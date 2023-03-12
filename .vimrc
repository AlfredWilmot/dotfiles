"    __   _(_)_ __ ___  _ __ ___
"    \ \ / / | '_ ` _ \| '__/ __|
"     \ V /| | | | | | | | | (__
"    (_)_/ |_|_| |_| |_|_|  \___|
" _______________________________________
"/ You'll wish that you had done some of \
"| the hard things when they were easier |
"\ to do.                                /
" ---------------------------------------
"        \   ^__^
"         \  (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||
" ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
" A minimal .vimrc targetted for developing
" in Python. Based on this article:
" https://realpython.com/vim-and-python-a-match-made-in-heaven/

" Setting the colorscheme to something easier on the eyes
	colorscheme desert 

" Ensure you're using a Python3 interpreter in python-mode
let g:pymode_python = 'python3'

" Set vim to use system-clipboard
	set clipboard=unnamed

" Hybrid relative line-numbering
" https://jeffkreeftmeijer.com/vim-number/
	set number
	augroup numbertoggle
	  autocmd!
	  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
	  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
	augroup END


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
	" fuzzy file-finder
		Plugin 'kien/ctrlp.vim'
call vundle#end()

" another vague requirement
filetype plugin indent on


" Ensure that the new windows split where we want them to
	set splitbelow
	set splitright

"split navigations
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>

" Enable folding of methods/classes with Ctrl+f
	set foldmethod=indent
	set foldlevel=99
	nnoremap <C-F> za
" show docstrings of folded code
	let g:SimpylFold_docstring_preview=1

" Proper PEP-8 indentation for Python files
	au BufNewFile,BufRead *.py
	" 4-space tabs
	    \ set tabstop=4
	    \ set softtabstop=4
	    \ set shiftwidth=4
	" ensure lines don't exceed 80 characters
	    \ set textwidth=79
	    \ set expandtab
	    \ set autoindent
	    \ set fileformat=unix

" proper tab spacing for other file types used for web-development
	au BufNewFile,BufRead *.js, *.html, *.css 
	    \ set tabstop=2
	    \ set softtabstop=2
	    \ set shiftwidth=2

" Flag superfluous whitespaces
	"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Use the appropriate encoding for Python3
	set encoding=utf-8

" Ensure auto-completion window dissapears when we're done with it
	let g:ycm_autoclose_preview_window_after_completion=1
" Short-cut for go-to function
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

" Make Python Pretty!
let python_highlight_all=1
syntax on
