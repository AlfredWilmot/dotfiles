#!/usr/bin/env bash

PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="${HOME}/.config"

. "${HOME}/.aliases"
. "${HOME}/.xprofile"

# beautify shell-prompt
eval "$(starship init bash)"

# run single tmux session on the current shell
[ -z "${TMUX}" ] && tmux

# include user utils in path
PATH="${PATH}:${HOME}/.local/bin"

# use pyenv for specifying user default Python version, if applicable
export PYENV_ROOT="${HOME}/.pyenv"
[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="${PYENV_ROOT}/bin:${PATH}"
which pyenv &> /dev/null && eval "$(pyenv init -)"
