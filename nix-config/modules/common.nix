{ pkgs, ... } :
with pkgs; [

# Git related packages
  delta
  git
  #gitui
  lazygit
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

# Console multiplexers
  tmux
  zellij

# Others
  nixfmt-rfc-style
]
