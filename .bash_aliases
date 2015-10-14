#!/bin/bash
#====================================================================
# BASH Alias
#--------------------------------------------------------------------
# Some are mine, some are others. Thanks to those who contributed
#====================================================================

#-------------------------------------------------------------
# Basic, high-level aliases
#-------------------------------------------------------------
alias which='type -a'
alias df='df -kTh' # Human-readable filesystem filesizes
alias reset='cd ~; clear'
alias r='reset'
alias h='cd ~'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'

#-------------------------------------------------------------
# Enable color support
#-------------------------------------------------------------
type dircolors >/dev/null 2>&1 && colorSupport="--color=auto" || colorSupport=""
alias dir='dir $colorSupport'
alias vdir='vdir $colorSupport'
alias grep='grep $colorSupport'
alias fgrep='fgrep $colorSupport'
alias egrep='egrep $colorSupport'

#-------------------------------------------------------------
# Arch Tools
#-------------------------------------------------------------
if [ -f /etc/arch-release ]; then
  alias pac-install='sudo pacman -S'
  alias pac-uninstall='sudo pacman -R'
  alias pac-search='pacman -Ss'
  alias pac-refresh='sudo pacman -Syy'
  alias pac-mirrors='sudo reflector --verbose -c US -p http --sort rate --save /etc/pacman.d/mirrorlist'
  alias pac-clean="sudo su -c 'pacman -cS --noconfirm'"

  alias aur-install='pacaur -y'
  alias aur-uninstall='pac-uninstall'
  alias aur-search='pacaur -s'

  alias arch-install='pacaur -Sy'
  alias arch-uninstall='pac-uninstall'
  alias arch-search='pacaur -Ss'
  alias arch-upgrade='sudo pacman -Sy; pacaur -Su; pac-clean; echo -e "\n${Green}Upgrade completed!${Color_Off}"'
  alias arch-clean="clean-orphans; clean-pacman;"
fi

#-------------------------------------------------------------
# APT Tools
#-------------------------------------------------------------
type apt-get >/dev/null 2>&1 && {
  alias apt-install='sudo apt-get install'
  alias apt-uninstall='sudo apt-get purge'
  alias apt-update='sudo apt-get update'
  alias apt-clean="sudo sh -c 'apt-get autoremove; apt-get autoclean; apt-get clean'"
  alias apt-upgrade="sudo sh -c 'apt-get update; apt-get upgrade; apt-get dist-upgrade;'"
  alias apt-info='apt-cache show'
  alias apt-installed='dpkg-query -l'
  function apt-search(){ \apt-cache search "$1" | sort; }
  function apt-search-names(){ \apt-cache search -n "$1" | sort; }
}

#-------------------------------------------------------------
# YUM Tools
#-------------------------------------------------------------
type yum >/dev/null 2>&1 && {}

#--------------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#--------------------------------------------------------------------
alias ls="ls --group-directories-first $colorSupport"
alias lx='ls -lXB'   # Sort by extension.
alias lk='ls -lSr'   # Sort by size, biggest last.
alias lt='ls -ltr'   # Sort by date, most recent last.
alias lc='ls -ltcr'  # Sort by/show change time,most recent last.
alias lu='ls -ltur'  # Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lvh"
alias lm='ll |more'    #  Pipe through 'more'
alias lr='ll -R'       #  Recursive ls.
alias la='ll -A'       #  Show hidden files.
alias tree='tree -Csh' #  Nice alternative to 'recursive ls' ...

#-------------------------------------------------------------
# Personal aliases
#-------------------------------------------------------------
alias hosts='sudo nano /etc/hosts'
alias path='echo -e ${PATH//:/\\n}' # Pretty-print of some PATH variables

#-------------------------------------------------------------
# Personal typo fixes
#-------------------------------------------------------------
alias cd..='cd ..'

#-------------------------------------------------------------
# Development Tools
#-------------------------------------------------------------
export HOMESTEAD_DIR='~/Homestead'
alias homestead-vm="ssh vagrant@127.0.0.1 -p 2222"
alias homestead-start="sh -c 'cd $HOMESTEAD_DIR; vagrant up'"
alias homestead-stop="sh -c 'cd $HOMESTEAD_DIR; vagrant halt'"
alias homestead-status="sh -c 'cd $HOMESTEAD_DIR; vagrant status'"
alias homestead-wipe="sh -c 'cd $HOMESTEAD_DIR; vagrant destroy --force'"
alias homestead-reload="sh -c 'cd $HOMESTEAD_DIR; vagrant provision'"
