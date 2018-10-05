# Setup PATH for user
set PATH $PATH "$HOME/.local/bin"


# Setup powerline for fish
set fish_powerline_path "$HOME/.local/lib/python2.7/site-packages/powerline/bindings/fish"
set fish_function_path $fish_function_path "$HOME/.local/bin"
source "$fish_powerline_path/powerline-setup.fish"
powerline-setup
