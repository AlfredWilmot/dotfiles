#!/usr/bin/env bash

PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="${HOME}/.config"

. "${HOME}/.aliases"
. "${HOME}/.xprofile"

eval "$(starship init bash)"
