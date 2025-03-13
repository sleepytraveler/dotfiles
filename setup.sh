#!/usr/bin/env sh

pushd ./pkgs/ >/dev/null

for dir in */; do                 # list directories in the form "/$1/dirname/"
  dir=${dir%*/}                   # remove the trailing "/"
  echo "Setting up ${dir##*/} .." # print everything after the final "/"
  stow "${dir##*/}" --target="$HOME"
done

popd >/dev/null
