# Script to do basic setup of the custom configuration that is common among my systems

# Script should be run after contents of dotfiles has been copied to ~/.config
ln -s $HOME/.config/gitconfig/git-config $HOME/.gitconfig
ln -s $HOME/.config/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.config/tmux $HOME/.tmux

# Install nix-env
curl https://nixos.org/nix/install | sh

# Source the bash profile files again as nix installation adds
# some lines to the bash profile
source $HOME/.config/bash/bash_profile
source $HOME/.profile
source $HOME/.bashrc

# Affter nix package manager is installed, use it to install common programs
nix-env -i tmux neovim keychain ripgrep fzf fish alacritty cscope bear

# Put a symoblic link to fish in $HOME/.local/bin - this is the expected
# path to fish in tmux configuration
ln -s $HOME/.nix-profile/bin/fish $HOME/.local/bin/fish

# Install vimplug plugin manager for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install tmux plugin manager - tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pip packages
if [ -x "$(command -v pip)" ]; then
	pip install --user neovim powerline-status
else
	echo "pip is not installed in the user path"
	exit 1
fi

echo "Launch tmux and install tmux plugins"
echo "Launch Neovim and install neovim plugins"
echo "Setup symbolic links to powerline-status folder in .config/fish and tmux"
