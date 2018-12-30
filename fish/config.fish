# Setup PATH for user
if test -d "$HOME/.local/bin"
	set PATH $PATH "$HOME/.local/bin"
end

# Setup powerline for fish
set fish_function_path $fish_function_path "$HOME/.config/fish/powerline/bindings/fish"
powerline-setup

# Set the EDITOR variable
set -Ux EDITOR nvim
