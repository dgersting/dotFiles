#!/bin/bash

echo "Setting up installer"

os_type=$(uname -s)
case "$os_type"
  Linux) # Regular Linux
    base_path=$(pathname $(realpath $0))
  ;;
  Darwin) # Mac OS X
    type lsb_release >/dev/null 2>&1 || {
      echo "This script requires Xcode Tools to be installed!"
      exit 1
    }
    base_path=$(dirname $(realpath $0))
  ;;
esac

echo "Symbolocly linking files into place"

# TODO: Change this to a blog
ln -s "$base_path/bashrc"       "~/.bashrc"
ln -s "$base_path/bash_profile" "~/.bash_profile"
ln -s "$base_path/bash_login"   "~/.bash_login"
ln -s "$base_path/bash_logout"  "~/.bash_logout"

echo "Cleanup"
# TODO: Any cleanup necessary?

source ~/bash_profile
echo "Done!"
