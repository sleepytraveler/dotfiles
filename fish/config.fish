# Setup PATH for user
if test -d "$HOME/.local/bin"
	set PATH $PATH "$HOME/.local/bin"
end

# Setup powerline for fish
set fish_function_path $fish_function_path "$HOME/.local/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup

# Set the EDITOR variable
set -Ux EDITOR nvim
