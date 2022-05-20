" settings
"
"
    "more sane leader key
let mapleader = "\<Space>"
    "detect files based on type
filetype on 
filetype plugin on 
    "enable line numbers
set nu 
set number relativenumber
    "change default split-window location
set splitbelow splitright 
    " Indentation options
set tabstop=4 softtabstop=4 
set shiftwidth=4
set expandtab
set smartindent
    " Indentation options
filetype indent on 
set colorcolumn=80 
set signcolumn=yes
    " Prevent line-wrap
set nowrap 
    " Shortcutting split navigation:
map <C-h> <c-w>h
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l
    " set-up copy-paste functionality using system-clipboard
    " need to install vim-gtk3 to enable this:  https://superuser.com/questions/1559544/how-to-copy-from-vim-to-clipboard-on-ubuntu-20-04
    " some useful mappings to make this easier: https://www.youtube.com/watch?v=E_rbfQqrm7g:W
map <C-p> "+P
vnoremap <C-c> "*y :let @+=@*<CR>
    "keep cursor more centered (keeps gap between cursor and border)
set scrolloff=8
    "regex highlighting options
set incsearch
    "information column (how dirty is my code?)
set colorcolumn=80
set signcolumn=yes
    "keep fileinfo always visible
set statusline+=%F



" Taken from Mickey's dotfiles repo (ensure plugin manager is installed if not)
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" load installed plugins
    call plug#begin('~/.vim/plugged')
        Plug 'morhetz/gruvbox'
    call plug#end()
" Don't forget to run the following to ensure plugins are installed locally!!
" source %
" PlugInstall

"setting colorscheme
    colorscheme gruvbox
    set background=dark



"Plugin-free fuzzy-finder implementation
" (https://www.reddit.com/r/vim/comments/orfpbd/interactive_fuzzy_finder_in_vim_without_plugins/)
" Ensure fzf is installed (apt-get install -y fzf)
function! FZF() abort
	let l:tempname = tempname()
	" fzf | awk '{ print $1":1:0" }' > file
	execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
	try
		execute 'cfile ' . l:tempname
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction

" :Files
command! Files call FZF()

" \ff
nnoremap <leader>ff :Files<cr>


"Plugin-free fuzzy-grepping (from above source)
" Ensure rip-grep is installed (apt-get install -y ripgrep)
function! RG(args) abort
	let l:tempname = tempname()
	let l:pattern = '.'
	if len(a:args) > 0
		let l:pattern = a:args
	endif
	" rg --vimgrep <pattern> | fzf -m > file
	execute 'silent !rg --vimgrep ''' . l:pattern . ''' | fzf -m > ' . fnameescape(l:tempname)
	try
		execute 'cfile ' . l:tempname
		redraw!
	finally
		call delete(l:tempname)
	endtry
endfunction

" :Rg [pattern]
command! -nargs=* Rg call RG(<q-args>)

" \fs
nnoremap <leader>fs :Rg<cr>
