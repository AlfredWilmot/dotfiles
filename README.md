```
           _       _    __ _ _           
        __| | ___ | |_ / _(_) | ___  ___ 
       / _` |/ _ \| __| |_| | |/ _ \/ __|
      | (_| | (_) | |_|  _| | |  __/\__ \
     (_)__,_|\___/ \__|_| |_|_|\___||___/
   _______________________________________
  / You'll wish that you had done some of \
  | the hard things when they were easier |
  \ to do.                                /
   ---------------------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

# Setting up Vim and deploying `.vimrc`
Tested on Ubuntu 20.04
* Install tools needed to clone and build the `vim` repo 
    ```bash
    sudo apt install git make clang libtool-bin
    ```
* Clone the official `vim` git repo:
    ```bash
    git clone https://github.com/vim/vim
    ```
* Following the instructions in `src/INSTALL` install prerequisite packages: 
    ```bash
    # Add X windows clipboard support (also needed for GUI):
    sudo apt install libxt-dev

    # Add GUI support:
    sudo apt install libgtk-3-dev

    # Add Python 3 support:
    sudo apt install libpython3-dev
    ```
* Uncomment the following line in `src/Makefile`
    ```bash
    CONF_OPT_PYTHON3 = --enable-python3interp
    ```
* Build and install ``Vim``:
    ```bash
    # build vim
    cd vim/src
    make

    # run tests 
    make test

    # install vim in /usr/local
    sudo make install

    # link to default location
    ln -s /usr/local/bin/vim /usr/bin/vim
    ```
* Validate your `Vim` installation:
```bash
# the binary that is executed when running vim (should be /usr/local/bin/vim) 
which vim

# ensure that your vim installation has all the necessary features for the plugins we want to use
vim --version
# VIM - Vi IMproved 9.0 (2022 Jun 28, compiled Jan 14 2023 23:44:41)
# Included patches: 1-1199
# Compiled by loki@loki-XPS-15-9510
# Huge version with GTK3 GUI.  Features included (+) or not (-):
# +acl               +file_in_path      +mouse_urxvt       -tag_any_white
# +arabic            +find_in_path      +mouse_xterm       -tcl
# +autocmd           +float             +multi_byte        +termguicolors
# +autochdir         +folding           +multi_lang        +terminal
# -autoservername    -footer            -mzscheme          +terminfo
# +balloon_eval      +fork()            +netbeans_intg     +termresponse
# +balloon_eval_term +gettext           +num64             +textobjects
# +browse            -hangul_input      +packages          +textprop
# ++builtin_terms    +iconv             +path_extra        +timers
# +byte_offset       +insert_expand     -perl              +title
# +channel           +ipv6              +persistent_undo   +toolbar
# +cindent           +job               +popupwin          +user_commands
# +clientserver      +jumplist          +postscript        +vartabs
# +clipboard         +keymap            +printer           +vertsplit
# +cmdline_compl     +lambda            +profile           +vim9script
# +cmdline_hist      +langmap           -python            +viminfo
# +cmdline_info      +libcall           +python3           +virtualedit
# +comments          +linebreak         +quickfix          +visual
# +conceal           +lispindent        +reltime           +visualextra
# +cryptv            +listcmds          +rightleft         +vreplace
# +cscope            +localmap          -ruby              +wildignore
# +cursorbind        -lua               +scrollbind        +wildmenu
# +cursorshape       +menu              +signs             +windows
# +dialog_con_gui    +mksession         +smartindent       +writebackup
# +diff              +modify_fname      -sodium            +X11
# +digraphs          +mouse             -sound             -xfontset
# +dnd               +mouseshape        +spell             +xim
# -ebcdic            +mouse_dec         +startuptime       -xpm
# +emacs_tags        -mouse_gpm         +statusline        +xsmp_interact
# +eval              -mouse_jsbterm     -sun_workshop      +xterm_clipboard
# +ex_extra          +mouse_netterm     +syntax            -xterm_save
# +extra_search      +mouse_sgr         +tag_binary        
# -farsi             -mouse_sysmouse    -tag_old_static 
```


## Enabling `.vimrc` features

```bash
# Install curl (needed for auto-install of Plugin manager when opening ~/.vimrc)
sudo apt install -y curl

# Enable MD-previewer functionality:
sudo apt-get install -y xdg-utils

# Setup your local .vimrc with a symbolic link to the one in this repo:
ln -sf ${PWD}/.vimrc ~/.vimrc
```
