" Python vimrc config
" (https://www.youtube.com/watch?v=YhqsjUUHj6g)

" Auto reload of vimrc
autocmd! bufwritepost .vimrc source %

"more sane leader key
let mapleader = "\<Space>"

" better copy/paste?
set pastetoggle=<F2>
set clipboard=unnamed

" Normal Copy-Paste (requires vim-gtk3)
" sudo apt-get install vim-gtk3
map <C-p> "+P
vnoremap <C-c> "*y :let @+=@*<CR>

" Enable point-click with mouse
set mouse=a

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C> :update<CR>
inoremap <C-Z> <C-O>:update<CR>

" easier tab navigation
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" easier code-block indentation manipulation
vnoremap < <gv
vnoremap > >gv

" Indentation options
set tabstop=4 softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Case-insensitive regex searches
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable backup and swap-file nonesense
set nobackup
set nowritebackup
set noswapfile

" Shortcutting split navigation:
map <C-h> <c-w>h
map <C-j> <c-w>j
map <C-k> <c-w>k
map <C-l> <c-w>l

"detect files based on type
filetype off
filetype plugin on
syntax on

"enable line numbers
set nu
set number relativenumber

" Prevent line-wrap
set nowrap

"change default split-window location
set splitbelow splitright

" Indentation options
filetype indent on
set colorcolumn=80
set signcolumn=yes

"keep cursor more centered (keeps gap between cursor and border)
set scrolloff=8

"information column (how dirty is my code?)
set colorcolumn=80
set signcolumn=yes

"keep fileinfo always visible
set statusline+=%F

" Alias 'replace all' to S:
nnoremap S :%s//g<Left><Left>

" Using Pathogen to manage plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
call pathogen#infect()


" ====================
" General plugins
" ====================

" A nice-to-look at color scheme
colorscheme gruvbox
set background=dark

" should highlight any trailing whitespace and remove it when saving
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Fuzzy-finder
set rtp+=~/.fzf
nnoremap <leader>ff :Files<cr>
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'



" ====================
" Python IDE Setup
" ====================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone https://github.com/powerline/powerline
set laststatus=2

" Settings for ctrip
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for rope (python code assist)
" cd ~/.vim/bundle
" git clone https://github.com/python-rope/ropevim.git
" pip install ropevim

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
" git submodule update --init --recursive
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enabel_shortcuts = 1
let g:pymode_rope = 1
let g:pymode_rope_completion = 1
let g:pymoe_rope_completion_bind = '<C-Space>'
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extend_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtins_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT <C-c>

" Improved navigation through 'omnicomplete' option list
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Settings for folding python functions/classes
" mkdir -p ~/.vim/ftplugin
"wget -O ~/.vim/ftplugin/python_editing.vim https://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable
