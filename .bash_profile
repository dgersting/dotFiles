#!/usr/bin/env bash
#====================================================================
# BASH Profile (Run per login shell)
#====================================================================

# Load system-wide profile
# [ -f /etc/profile ] && . /etc/profile

# The magic 'dot-files' var pointing us home
# (this lets us use relative paths allowing for portability)
export DOTFILES="$HOME/.dotFiles"

#----------------------
# mico helper functions
#----------------------
command_exists(){ command -v "$@" > /dev/null 2>&1; }
source_file(){ [ -f "$1" ] && . "$1"; }
load_dot_file(){ source_file "$DOTFILES/$1"; }

#--------------------------------------------
# Load local 'secrets' file if it exists
#--------------------------------------------
source_file "$HOME/.bash_secrets"

#------------------
# Setup environment
#------------------
load_dot_file "myShell/env"

#----------------------
# Setup $PATH
#----------------------
load_dot_file "myShell/path"

# Enable color support
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
# if [ -f /usr/bin/source-highlight-esc.sh ]; then
#   export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
#   export LESS='-R '
# fi
#

# Load RVM
# [ -f ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

# Last, we load our .bashrc (which isn't auto-ran on 1st login shell for some reason)
[ -f ~/.bashrc ] && . ~/.bashrc
