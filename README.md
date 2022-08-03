# dotfiles!

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

Clone repo then make a soft symbolic link to wherever the service that uses the dotfile is expecting to find it.

> Vim:
> `ln -sf ${PWD}/.vimrc ~/.vimrc`

> Ranger:
> `ln -sf ${PWD}/.`
