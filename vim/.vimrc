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

" Basic config
source ~/.vim/.config/basic.vim
" Python-specific config
source ~/.vim/.config/python.vim
" Autocmds config
source ~/.vim/.config/autocmds.vim
" Plugins config
source ~/.vim/.config/plugins.vim
" Project-wide fuzzy-finder
source ~/.vim/.config/fzf.vim
" Project-wide regex-based keyword search
source ~/.vim/.config/ack.vim
