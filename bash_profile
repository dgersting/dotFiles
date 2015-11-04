#!/bin/bash
#====================================================================
# BASH Profile (Run per login shell)
#====================================================================

# Load system-wide profile
[ -f /etc/profile ] && . /etc/profile

#----------------------
# mico helper functions
#----------------------
function sourceFile{ [ -f "$1" ] && . "$1"; }

#----------------------
# Environment variables
#----------------------

# The magic 'dot-files' var pointing us home (this lets us use relative paths allowing for portability)
export _DOT_FILES=$(dirname $(readlink $BASH_SOURCE))

# Smart EDITOR (cascade down available editors)
export EDITOR
[ -z "$EDITOR" ] && type atom &>/dev/null && EDITOR='atom'
[ -z "$EDITOR" ] && type subl &>/dev/null && EDITOR='subl'
[ -z "$EDITOR" ] && type nano &>/dev/null && EDITOR='nano'
[ -z "$EDITOR" ] && type vi   &>/dev/null && EDITOR='vi'

# Set vagrant .dot file to correct location (based on OS)
export VAGRANT_DOTFILE_PATH
[ -z "$VAGRANT_DOTFILE_PATH" ] && [[ "$(uname)" == "Darwin" ]] && export VAGRANT_DOTFILE_PATH='/Users/dgersting/.vagrant'
[ -z "$VAGRANT_DOTFILE_PATH" ] && [[ "$(uname)" == "Linux"  ]] && export VAGRANT_DOTFILE_PATH='/home/dgersting/.vagrant'

# Set timezone to America/New_York
export TZ='/usr/share/zoneinfo/America/New_York'

# Set JAVA_HOME
[ -z "$JAVA_HOME" ] && [ -d /opt/java/current ]    && export JAVA_HOME='/opt/java/current'
[ -z "$JAVA_HOME" ] && [ -d /usr/java/default ]    && export JAVA_HOME='/usr/java/default'
[ -z "$JAVA_HOME" ] && [ -d /usr/lib/jvm/default ] && export JAVA_HOME='/usr/lib/jvm/default'

# Enable color support
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [ -f /usr/bin/source-highlight-esc.sh ]; then
  export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
  export LESS='-R '
fi

# Load helper env variables
export OS_TYPE=$(uname -s)

#----------------------
# PATH Setup
#----------------------

# Local bin (if it exists)
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# Local bin (if it exists)
[ -d "$HOME/scripts/bin" ] && PATH="$HOME/scripts/bin:$PATH"

# PHP Composer bin (if it exists)
[ -d "$HOME/.composer/vendor/bin" ] && PATH="$HOME/.composer/vendor/bin:$PATH"

# RVM bin (if it exists)
[ -d "$HOME/.rvm/bin" ] && PATH="$HOME/.rvm/bin:$PATH"

# Android SDK bin (if it exists)
#[ -d "$HOME/opt/androidDevKit/current/sdk/tools" ] && PATH="$PATH:$HOME/opt/androidDevKit/current/sdk/tools"
#[ -d "$HOME/opt/androidDevKit/current/sdk/platform-tools" ] && PATH="$PATH:$HOME/opt/androidDevKit/current/sdk/platform-tools"

# Load RVM
[ -f ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm

# Add . to the start of PATH for any local executables (Keep at the end of the file to put it at the start of PATH)
export PATH=".:$PATH"

# Last, we load our .bashrc (which isn't auto-run on 1st login shell)
[ -f ~/.bashrc ] && . ~/.bashrc
