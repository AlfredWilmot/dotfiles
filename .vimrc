" basics for ease of use:
    let mapleader=" " 
    set number relativenumber
    set splitbelow splitright
    set nu
    " keeps any buffer being edited in the background (prevents accidental losses) 
    set hidden
    set nowrap
    "ignore sase-sensitivity when searching 
    set ignorecase 
    "history managment
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile
    "regex highlighting options
    set incsearch
    "keep cursor more centered (keeps gap between cursor and border)
    set scrolloff=8
    "information column (how dirty is my code?)
    set colorcolumn=80
    set signcolumn=yes
    " Indentation options
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent
    " tab-completion
    set wildmode=longest,list,full
    set wildmenu
    " Shortcutting split navigation:
    map <C-h> <c-w>h
    map <C-j> <c-w>j
    map <C-k> <c-w>k
    map <C-l> <c-w>l
    " quickly open selected file from ripgrep in new tab
    " (only for quickfix window:
    " https://vi.stackexchange.com/questions/27794/how-to-open-ripgrep-search-in-new-tab)
    augroup quickfix_tab | au!
        au filetype qf nnoremap <buffer> <C-t> <C-w><CR><C-w>T
    augroup END
    " set-up copy-paste functionality using system-clipboard
    " need to install vim-gtk3 to enable this:  https://superuser.com/questions/1559544/how-to-copy-from-vim-to-clipboard-on-ubuntu-20-04
    " some useful mappings to make this easier: https://www.youtube.com/watch?v=E_rbfQqrm7g:W
    map <C-p> "+P
    vnoremap <C-c> "*y :let @+=@*<CR>


" make editing enclosed elements quicker:
    nnoremap S :%s//g<Left><Left>

"plugged (plugin manager: more infor here)
" fzf, ripgrep

" Taken from Mickey's dotfiles repo (ensure plugin manager is installed if not)
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

" load installed plugins
    call plug#begin('~/.vim/plugged')
        Plug 'junegunn/fzf', { 'do': './install --all' }
        Plug '~/.fzf' 
        Plug 'jremmen/vim-ripgrep'
        Plug 'preservim/nerdtree'
        Plug 'vim-syntastic/syntastic'
        Plug 'morhetz/gruvbox'
    call plug#end()
" Don't forget to run the following to ensure plugins are installed locally!!
" (https://vimawesome.com/plugin/vim-ripgrep)
" source %
" PlugInstall



"setting colorscheme
    colorscheme gruvbox
    set background=dark

"NERDTree Settings
    nmap <C-f> :NERDTreeToggle<CR>
    " Start NERDTree and leave the cursor in it.
    autocmd VimEnter * NERDTree
    " Close the tab if NERDTree is the only window remaining in it.
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
