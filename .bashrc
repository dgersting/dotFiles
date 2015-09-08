#!/bin/bash
#====================================================================
# BASH Config
#====================================================================

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load system-wide bashrc
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# Load extra bash files
[ -f ~/.bash_colors ]    && . ~/.bash_colors
[ -f ~/.bash_prompt ]    && . ~/.bash_prompt
[ -f ~/.bash_aliases ]   && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_fn

#----------------------
# Settings and Config
#----------------------

# Bash history settings
HISTCONTROL=ignoreboth # Ignore duplicate commands and commands that start w/ space (ignoredups:ignorespace)
HISTSIZE=1000          # Number of items in the bash session's history
HISTFILESIZE=100000    # Number of items in the history file
shopt -s histappend    # Append BASH session history to the history file (no simply write it)

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
