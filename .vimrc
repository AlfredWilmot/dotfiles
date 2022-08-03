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


"more sane leader key
let mapleader = "\<Space>"


" Ensure plugin manager is installed if not
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif


" Auto reload of vimrc
autocmd! bufwritepost .vimrc source %

" load installed plugins
    call plug#begin('~/.vim/plugged')
        Plug 'morhetz/gruvbox'                  " Colors!
        Plug 'mileszs/ack.vim'                  " Recursive regex search wrt current working directory
        Plug 'francoiscabrol/ranger.vim'        " Call-up a file-tree navigator from vim on command
        "Plug 'haya14busa/is.vim'               " Automatically clear search highlights after you move your cursor.
        Plug 'ntpeters/vim-better-whitespace'   " See trailing whitespaces more clearly
        Plug 'mhinz/vim-signify'                " Shows git file changes in the 'gutter'
        Plug 'tpope/vim-fugitive'               " Git wrapper
        Plug 'vim-scripts/AutoComplPop'         " Show vims complete menu while typing
        Plug 'unblevable/quick-scope'           " Highlight which character to jump to when using horizontal movement keys
        Plug 'janko/vim-test'                   " Test suites for various languages


        " Languages and file types.
        Plug 'cakebaker/scss-syntax.vim'
        Plug 'chr4/nginx.vim'
        Plug 'chrisbra/csv.vim'
        Plug 'ekalinin/dockerfile.vim'
        Plug 'elixir-editors/vim-elixir'
        Plug 'Glench/Vim-Jinja2-Syntax'
        Plug 'fatih/vim-go'
        Plug 'cespare/vim-toml', { 'branch': 'main' }
        Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
        Plug 'jvirtanen/vim-hcl'
        Plug 'lifepillar/pgsql.vim'
        Plug 'othree/html5.vim'
        Plug 'pangloss/vim-javascript'
        Plug 'MaxMEllon/vim-jsx-pretty'
        Plug 'PotatoesMaster/i3-vim-syntax'
        Plug 'stephpy/vim-yaml'
        Plug 'tmux-plugins/vim-tmux'
        Plug 'tpope/vim-git'
        Plug 'tpope/vim-liquid'
        Plug 'tpope/vim-rails'
        Plug 'vim-python/python-syntax'
        Plug 'vim-ruby/vim-ruby'
        Plug 'wgwoods/vim-systemd-syntax'
        Plug 'towolf/vim-helm'
        Plug 'hashivim/vim-terraform'

    call plug#end()
" Don't forget to run the following to ensure plugins are installed locally!!
" source %
" PlugInstall




    " Enable point-click with mouse
set mouse=a
    " stop generating those pesky swap files
set noswapfile
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
    " Alias 'replace all' to S:
nnoremap S :%s//g<Left><Left>
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
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

"Ripped from https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
    " Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1
    " Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
    " Don't jump to first match
cnoreabbrev Ack Ack!
    " Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
    " Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
    "Stuff for Ranger Plugin (https://github.com/francoiscabrol/ranger.vim)
map <leader>ra :Ranger<CR>
