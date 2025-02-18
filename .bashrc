#!/usr/bin/env bash

PS1='[\u@\h \W]\$ '

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lah --color=auto'
alias grep='grep --color=auto'

source "${HOME}/.aliases"
