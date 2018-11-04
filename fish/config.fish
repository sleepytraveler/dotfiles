# Setup PATH for user
if test -d "$HOME/.local/bin"
	set PATH $PATH "$HOME/.local/bin"
end

if test -d "$HOME/bin"
	set PATH "$HOME/bin"
end


# Setup powerline for fish
set fish_powerline_path "$HOME/.local/lib/python3.7/site-packages/powerline/bindings/fish"
set fish_function_path $fish_function_path "$HOME/.local/bin"
source "$fish_powerline_path/powerline-setup.fish"
powerline-setup

# Set the EDITOR variable
set -Ux EDITOR nvim
