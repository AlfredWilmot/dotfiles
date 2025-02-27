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
