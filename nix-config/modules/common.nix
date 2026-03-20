# Keep an eye on the github awesome-rust repo for a list of rust utilities

{ pkgs, ... } :
with pkgs; [

# Git related packages
  delta
  git
  #gitui
  lazygit
  tig
  jujutsu

# Shell configuration packages
  bat
  clipboard-jh
  dust
  duf
  curl
  eza
  fd
  fzf
  fish
  ripgrep
  starship
  tealdeer
  zoxide
  procs

# Console multiplexers
  tmux
  zellij

# Others
  nixfmt
]
