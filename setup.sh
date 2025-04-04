#!/bin/bash

stow_pkgs_in_dir() {
  for dir in */; do                    # list directories in the form "/$1/dirname/"
    dir=${dir%*/}                      # remove the trailing "/"
    echo -e "Setting up ${dir##*/} .." # print everything after the final "/"
    stow "${dir##*/}" --target="$HOME"
  done
}

## Helpful script from: https://systemcrafters.net/managing-your-dotfiles/using-gnu-stow/

# Sync dotfiles repo and ensure that dotfiles are tangled correctly afterward

GREEN='\033[1;32m'
BLUE='\033[1;34m'
RED='\033[1;30m'
NC='\033[0m'

echo -e "${BLUE}Stashing existing changes...${NC}"
stash_result=$(git stash push -m "sync-dotfiles: Before syncing dotfiles")
needs_pop=1
if [ "$stash_result" = "No local changes to save" ]; then
  needs_pop=0
fi

echo -e "${BLUE}Pulling updates from dotfiles repo...${NC}"
echo -e
git pull origin main --rebase --prune
# git submodule update --recursive
echo -e

if [[ $needs_pop -eq 1 ]]; then
  echo -e "${BLUE}Popping stashed changes...${NC}"
  echo -e
  git stash pop
fi

unmerged_files=$(git diff --name-only --diff-filter=U)
if [[ ! -z $unmerged_files ]]; then
  echo -e "${RED}The following files have merge conflicts after popping the stash:${NC}"
  echo -e
  printf %"s\n" $unmerged_files # Ensure newlines are printed
else
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

  if [[ "$OSTYPE" == "darwin"* ]]; then
    cd ./macos-pkgs/
    stow_pkgs_in_dir
    cd ../
  fi

  for arg in "$@"; do
    echo "Argument: $arg"
    if [[ $arg == "server" ]]; then
      cd ./server-pkgs/
      stow_pkgs_in_dir
      cd ../
    fi

    if [[ $arg == "work" ]]; then
      cd ./work-dotfiles/
      stow_pkgs_in_dir
      cd ../
    fi
  done

fi
