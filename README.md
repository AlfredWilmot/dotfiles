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

## Initial setup
Setup your local .vimrc with a symbolic link to the one in this repo:
> `ln -sf ${PWD}/.vimrc ~/.vimrc`

For Python development:
* setup your venv (assuming you have python3 installed):
    > `python3 -m venv .venv`
* If `vim-jedi` is not able to pick-up your `.venv` while it's activated, you can just add it to your `PYTHONPATH` similarly to this:
    > `export PYTHONPATH+=:${PWD}/.venv/lib/python3.8/site-packages/

* Enable MD-previewer functionality:
    > `sudo apt-get install -y xdg-utils`

* use `vim-gtk3` as this has `clipboard` and `xterm_clipboard` installed needed for sane copy/paste to-and-from vim by using the system clipboard as the copy buffer. You can install `vim-gtk3`, remove any native installation of `vim` and then symbolically link `vim.gtk3` to `vim` so you can call `vim.gtk3` by typing `vim` in the terminal:
    > `sudo apt-get install -y vim-gtk3`

    > `rm -rf /usr/bin/vim`

    > `sudo ln -s /usr/bin/vim.gtk3 /usr/bin/vim`

