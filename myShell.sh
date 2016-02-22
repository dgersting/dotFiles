#!/usr/bin/env bash

GITHUB_USER="dgersting"
GITHUB_REPO="dotFiles"
GITHUB_BRANCH="master"
DOTFILE_DIR="$HOME/.dotFiles"
VERBOSE=false

################################################################################

URL_GIT_HTTP="https://github.com/$GITHUB_USER/$GITHUB_REPO.git"
URL_GIT_SSH="git@github.com:$GITHUB_USER/$GITHUB_REPO.git"
URL_ZIP="https://github.com/$GITHUB_USER/$GITHUB_REPO/archive/$GITHUB_BRANCH.zip"
SPACER=""

command_exists(){ command -v "$@" > /dev/null 2>&1; }

__stdout(){
  echo -e "$SPACER$1"
}

__stderr(){
  echo -e "$SPACER$1"
  # (>&2 echo -ne "$1")
}

__fetal(){
  __stderr "$1\n\n"
  exit 1
}

__verbose(){
  [ "$VERBOSE" = true ] && __stdout "$1"
}

__spacer_more(){
  SPACER="$SPACER "
}
__spacer_less(){
  SPACER="${SPACER:1}"
}

__usage(){
  echo "Usage for myShell:"
  echo "$0 {command} {options}"
  echo
  echo "Available Commands:"
  echo "  install"
  echo "  update"
  echo
  echo "Variables:"
  echo "  GitHub Username:    $GITHUB_USER"
  echo "  GitHub Repository:  $GITHUB_REPO"
  echo "  GitHub Branch:      $GITHUB_BRANCH"
  echo "  DotFiles Location:  $DOTFILE_DIR"
  echo
  echo "Generated Variables:"
  echo "  URL for zip archive:   $URL_ZIP"
  echo "  URL for git via HTTP:  $URL_GIT_HTTP"
  echo "  URL for git via SSH:   $URL_GIT_SSH"
  echo
  echo
}

__wget(){
  command_exists wget && {
    __stdout "Downloading '$1' via wget"
    wget "$1" -O "$2" &> /dev/null
    ret=$?
    [ $? -eq 0 ] && __stdout "Saved to: $2"
    return $ret
  }
  command_exists curl && {
    curl "$1" -o "$2"
    return $?
  }
}

install(){
  __fetal "Need to implement 'install' command"

  cd "$DOTFILE_DIR"
  case "$1" in
    git)
      git pull
      ;;

    svn)
      git pull
      ;;

    zip)
      ;;

    *)
      __stderr "Usage: myShell update <>"
      ;;
  esac
}

update(){
  [ -e "$DOTFILE_DIR" -a ! -f "$DOTFILE_DIR" ] || _z_fetal "No dotFile directory located at $DOTFILE_DIR"

  cd "$DOTFILE_DIR/"
  # command_exists git && {
  #   echo "Updating via Git..."
  #   git pull
  #   return $?
  # }
  # command_exists svn && {
  #   echo "Updating via Subversion..."
  #   svn up
  #   return $?
  # }
  command_exists unzip && {
    __stdout "Updating via zip archive..."
    __spacer_more
    TMPFILE=$(mktemp)
    __wget "$URL_ZIP" "$TMPFILE"
    rm -rf "$DOTFILE_DIR"
    unzip "$TMPFILE" -d "$HOME"
    mv "$HOME/dotFiles-master" "$DOTFILE_DIR"
    return 0
    __spacer_less
    return 1
  }

  __stderr "Failed to update myShell!"
  return 1
}

#Patch for SunOS (need to find a better solution :/)
export PATH="$PATH:/usr/sfw/bin"

# Get command name
cmd="$1"
shift

# Check for verbose flag
# [[ "$1" == "-v" ]] && {
#   VERBOSE=false
#   shift
# }

# Let's go!
case "$cmd" in
  install)
    install
    exit $?
    ;;

  update)
    update
    exit $?
    ;;

  *)
    __usage
    ;;
esac

exit 0
