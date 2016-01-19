

#!/usr/bin/env zsh
#====================================================================
# ZSHELL RC (Run per shell)
#====================================================================

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load Antigen and hand off to its rc file
source "$ZDOTDIR/antigen/antigen.zsh"
source "$ZDOTDIR/.antigenrc"

# Load extra bash files. 1st from Dropbox (if it exists) than from HOME (if it exists)
# files="colors prompt fn aliases"
files="fn aliases"
for file in $files; do
  source_file "$ZDOTDIR/extras/$file"
  source_file "$HOME/.z$file"
done

# Enable auto-rehash to pick up new bin files
zstyle ':completion:*' rehash true

# Load my prompt
#source_file $ZDOTDIR/extras/prompt
#autoload -U colors && colors


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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
