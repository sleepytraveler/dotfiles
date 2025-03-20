# C development environment packages
{ pkgs, ... } :
with pkgs; [
  python3
  python313Packages.pip
  python313Packages.pynvim
  python313Packages.pyright
]
