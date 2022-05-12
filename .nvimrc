" pulgins
"
call plug#begin('~/.vim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" colors
"
set t_Co=256 "required for urxvt
set background=dark "dark or light
colorscheme PaperColor

" settings
"
"
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



" Find files using Telescope command-line sugar.
"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" grab other config files 
"
source $HOME/.config/nvim/plug-config/coc.vim

