#!/usr/bin/env zsh
#====================================================================
# ZSHELL Profile (Run per login shell)
#====================================================================

# The magic 'dot-files' var pointing us home
# (this lets us use relative paths allowing for portability)
export _DOT_FILES="$ZDOTDIR"

#----------------------
# mico helper functions
#----------------------
command_exists(){ command -v "$@" > /dev/null 2>&1; }
source_file(){ [ -f "$1" ] && . "$1"; }
load_dot_file(){ source_file "$_DOT_FILES/$1" }

#------------------
# Setup environment
#------------------
load_dot_file "_env"

#----------------------
# Setup $PATH
#----------------------
load_dot_file "_path"
