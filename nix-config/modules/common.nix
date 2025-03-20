{ pkgs, ... } :
with pkgs; [

# Git related packages
  delta
  git
  gitui
  tig

# Shell configuration packages
  bat
  clipboard-jh
  du-dust
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

# TMUX related packages
  tmux
  tmuxPlugins.vim-tmux-navigator
  tmuxPlugins.sensible
  zellij

# Others
  nixfmt-rfc-style
]
