#!/usr/bin/env bash
#====================================================================
# BASH RC (Run per bash shell)
#====================================================================

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load aliases
load_dot_file "myShell/aliases"

# Load functions
load_dot_file "myShell/func"

# Load my prompt!
load_dot_file "myShell/prompt"


# Load system-wide bashrc
# [ -f /etc/bash.bashrc ] && . /etc/bash.bashrc
# [ -f /etc/bashrc ]      && . /etc/bashrc

# Load extra bash files. 1st from Dropbox (if it exists) than from HOME (if it exists)
# files="colors prompt fn aliases"
# for file in $files; do
#   sourceFile "$_DOT_FILES/extras/$file"
#   sourceFile "$HOME/.bash_$file"
# done

#----------------------
# Settings and Config
#----------------------

# Bash history settings
# HISTCONTROL=ignoreboth # Ignore duplicate commands and commands that start w/ space (ignoredups:ignorespace)
# HISTSIZE=1000          # Number of items in the bash session's history
# HISTFILESIZE=100000    # Number of items in the history file
# shopt -s histappend    # Append BASH session history to the history file (not simply write it)

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
# shopt -s checkwinsize
