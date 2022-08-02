#TODO: automate these installation steps in vimrc (or here?) to auto-install missing packages

# ====================
# Install deps (missing more? TODO)
# ====================

# Normal Copy-Paste (requires vim-gtk3)
# sudo apt-get install vim-gtk3
#ap <C-p> "+P
#noremap <C-c> "*y :let @+=@*<CR>

# ====================
# Plugin manager (pathogen)
# ====================

# Using Pathogen to manage plugins
# mkdir -p ~/.vim/autoload ~/.vim/bundle
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# ====================
# Plugins for Python IDE behaviour
# ====================

# Settings for vim-powerline
# cd ~/.vim/bundle
# git clone https://github.com/powerline/powerline

# Settings for ctrip
# cd ~/.vim/bundle
# git clone https://github.com/kien/ctrlp.vim

# Settings for python-mode
# cd ~/.vim/bundle
# git clone https://github.com/klen/python-mode

#Settings for folding python functions/classes
# mkdir -p ~/.vim/ftplugin
#wget -O ~/.vim/ftplugin/python_editing.vim https://www.vim.org/scripts/download_script.php?src_id=5492

# ====================
# Taken from Mickey's dotfiles repo (ensure "Plug" plugin manager is installed if not)
# ====================
# Plugins for Python IDE behaviour
#let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
#if empty(glob(data_dir . '/autoload/plug.vim'))
#    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
#endif
