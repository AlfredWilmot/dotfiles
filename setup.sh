#TODO: automate these installation steps in vimrc (or here?) to auto-install missing packages

# ====================
# Install deps (missing more? TODO)
# ====================

# Install missing deps
sudo apt-get update
sudo apt-get install -y vim-gtk3 # for sane copy-paste?
sudo apt-get install -y ripgrep  # for fzf

# Pathogen plugin manager
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugins for "python-ide" behaviour
cd ~/.vim/bundle
git clone https://github.com/powerline/powerline
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/klen/python-mode
cd python-mode
git submodule update --init --recursive
cd ~/.vim/bundle
git clone https://github.com/junegunn/fzf.vim.git
git submodule update --init --recursive
mkdir -p ~/.vim/ftplugin
wget -O ~/.vim/ftplugin/python_editing.vim https://www.vim.org/scripts/download_script.php?src_id=5492
# NOTE: ^ removed the annoying mapping of f to single fold and changed <C-f> to togglefoldall

# You Complete Me (YCM: https://vimawesome.com/plugin/youcompleteme#linux-64-bit)
sudo apt install build-essential cmake vim-nox python3-dev
sudo apt install mono-complete golang nodejs default-jdk npm
cd ~/.vim/bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --all



# use ipdb as debugger
pip install ipdb

# ====================
# Taken from Mickey's dotfiles repo (ensure "Plug" plugin manager is installed if not)
# ====================
# Plugins for Python IDE behaviour
#let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
#if empty(glob(data_dir . '/autoload/plug.vim'))
#    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
#endif
