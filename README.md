# Dotfiles
Files used to configure my development environment using [GNU stow](https://www.gnu.org/software/stow/).

## Usage
Install `stow`, and run it in the following manner to create all the necessary symlinks from this repo to the `${HOME}` directory:

```bash
cd dotfiles
stow .
```

Provided the config files in this repo are organised in the same layout where the applications that use them would expect them to be
located starting from the `${HOME}` directory, then you're good to go!
