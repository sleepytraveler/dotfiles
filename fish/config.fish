# Setup powerline for fish
# set fish_function_path $fish_function_path "$HOME/.config/fish/powerline/bindings/fish"
# powerline-setup

# Set the EDITOR variable
set -Ux EDITOR nvim
# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions/ $fish_function_path
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish

# Add ~/.local/bin to PATH
set PATH $PATH $HOME/.local/bin/
