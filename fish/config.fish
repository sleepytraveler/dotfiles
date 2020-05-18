# Setup powerline for fish
# set fish_function_path $fish_function_path "$HOME/.config/fish/powerline/bindings/fish"
# powerline-setup

# Set the EDITOR variable
set -Ux EDITOR nvim
# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/theme-pure/functions/ $fish_function_path
source $HOME/.config/fish/functions/theme-pure/conf.d/pure.fish

if test -d $HOME/.local/bin
	set PATH $HOME/.local/bin $PATH
end

if test -d $HOME/.cargo/bin
	set PATH $HOME/.cargo/bin $PATH
end

if test -d $HOME/yarn/bin
	set PATH $PATH $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin
end

if test -d /usr/local/bin
	set PATH $PATH /usr/local/bin
end

if test -d $HOME/.fzf/bin
	set PATH $PATH $HOME/.fzf/bin/
end

if test -d /snap/bin
	set PATH /snap/bin $PATH
end

# Add ssh-agent init
fish_ssh_agent
