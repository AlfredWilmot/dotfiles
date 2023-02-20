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

"keep fileinfo always visible
set statusline+=%F


" Ensure plugin manager is installed if not
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif


" load installed plugins
call plug#begin('~/.vim/plugged')

    " Aesthetic
    Plug 'morhetz/gruvbox'

    " File-navigation

        " recursive regex on all files wrt ./
        Plug 'mileszs/ack.vim'

        " Directory tree visualizer features
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'preservim/nerdtree'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        " Recursive fuzzy file-finder wrt ./
        Plug 'junegunn/fzf.vim'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

    " Version-control
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'

    " Vim-usage utilities
    Plug 'haya14busa/is.vim'                " Automatically clear search highlights after you move your cursor.
    Plug 'ntpeters/vim-better-whitespace'   " See trailing whitespaces more clearly
    Plug 'unblevable/quick-scope'           " Highlight which character to jump to when using horizontal movement keys
    Plug 'jiangmiao/auto-pairs'

    " DevOps

        " Config files
        Plug 'chrisbra/csv.vim'
        Plug 'stephpy/vim-yaml'
        Plug 'cespare/vim-toml', { 'branch': 'main' }
        Plug 'jvirtanen/vim-hcl' " Hachicorp Configuration Language

        " IaC (Infrastructure as Code)

            " Docker
            Plug 'ekalinin/dockerfile.vim'

            " Terraform
            Plug 'hashivim/vim-terraform'

    " Dev

        " Language support
        Plug 'neoclide/coc.nvim'

        " Snippets
        Plug 'SirVer/ultisnips'
        Plug 'honza/vim-snippets'
        Plug 'natebosch/dartlang-snippets'

        " Language-specific

            " Go
            Plug 'fatih/vim-go'

            " Dart
            Plug 'dart-lang/dart-vim-plugin'
            Plug 'thosakwe/vim-flutter'

            " Python
            "Plug 'andviro/flake8-vim'
            "Plug 'vim-python/python-syntax'

            " Markdown
            Plug 'godlygeek/tabular'
            Plug 'tpope/vim-markdown'
            Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " requires yarn, node-js and xdg-utils

call plug#end()
" Don't forget to run the following to ensure plugins are installed locally!!
" source %
" PlugInstall
" :call mkdp#util#install()"

" =============================
" gruvbox settings (colorscheme)
" =============================

colorscheme gruvbox
set background=dark


" =============================
" vim-markdown settings (https://www.youtube.com/watch?v=22JAs0kNA9k&t=46s)
" =============================

" prevent syntax from being hidden
autocmd FileType markdown set conceallevel=0
"default unfolded
autocmd FileType markdown normal zR
let g:vim_markdown_formatter=1


" =============================
" markdown-preview settings
" =============================

" only refresh the MD preview when saving
"let g:mkdp_refresh_slow=1
" only show MD preview when requested by user
let g:mkdp_auto_start=0
map <C-p> :MarkdownPreview<CR>

" =============================
" misc settings
" =============================

" Auto reload of vimrc
autocmd! bufwritepost .vimrc source %

" Enable point-click with mouse
set mouse=a

" stop generating those pesky swap files
set noswapfile

" use the system clipboard by default (https://advancedweb.hu/working-with-the-system-clipboard-in-vim/)
" check 'vim --version', contains either the +clipboard or +xterm_clipboard flags
set clipboard=unnamedplus

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

"keep cursor more centered (keeps gap between cursor and border)
set scrolloff=8

" Case-insensitive regex searches
set hlsearch
set incsearch
set ignorecase
set smartcase

"information column (how dirty is my code?)
set colorcolumn=80
set signcolumn=yes

" Alias 'replace all' to S:
nnoremap S :%s//g<Left><Left>

" easier code-block indentation manipulation
vnoremap < <gv
vnoremap > >gv

" utf-8 is needed for most flavors of unicode
set encoding=utf-8

" Prevent x and the delete key from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

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

" Some Jenkins linting stuff
" References:
" > https://davidcraddock.net/2022/02/19/working-with-jenkinsfiles-in-vim/
" > https://www.youtube.com/watch?v=9IjKUGn2TIk

    " Jenkinsfile syntax highlightling
autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy

    " Jenkinsfile linting
autocmd BufWritePost Jenkinsfile !java -jar ~/jenkins-cli.jar -s http://ds1-test-farm.touchsurgery.com/ -auth admin:digis -webSocket declarative-linter < %


nnoremap <leader>fe :CocCommand flutter.emulators <CR>
nnoremap <leader>fd :below new output:///flutter-dev <CR>
nnoremap <C-b> :NERDTreeToggle<CR>
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']
" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Fuzzy-finder settings
"  Allow finding of hidden files: https://github.com/junegunn/fzf/issues/337#issuecomment-136389913
let $FZF_DEFAULT_COMMAND = 'find .'
nmap <leader>ff :FZF<CR>

" Git settings
nmap <leader>gs :G<CR>
nmap <leader>gl :G log<CR>
nmap <leader>gb :G blame<CR>

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)



"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-pyright',
  \ ]


let g:NERDTreeGitStatusWithFlags = 1
