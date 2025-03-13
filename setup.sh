#!/usr/bin/env sh

stow_pkgs_in_dir() {
  for dir in */; do                 # list directories in the form "/$1/dirname/"
    dir=${dir%*/}                   # remove the trailing "/"
    echo "Setting up ${dir##*/} .." # print everything after the final "/"
    stow "${dir##*/}" --target="$HOME"
  done
}

#
# Setup configuration for programs that are common to all platforms - macOS & Linux
#

# pushd "./pkgs/" >/dev/null
cd ./pkgs/
stow_pkgs_in_dir
# popd >/dev/null
cd ../

#
# Setup configuration for programs used only on macOS
#

cd ./macos-pkgs/
stow_pkgs_in_dir
cd ../
