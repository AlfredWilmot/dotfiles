" Ensure you're using a Python3 interpreter in python-mode
let g:pymode_python = 'python3'

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
