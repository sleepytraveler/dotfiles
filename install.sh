#!/bin/sh

# Script to do basic setup of the custom configuration that is common among my systems
rsync -av . $PWD $HOME/.config
cd $HOME/.config

ln -s $HOME/.config/gitconfig/git-config $HOME/.gitconfig
ln -s $HOME/.config/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.config/tmux $HOME/.tmux

# Install nix-env
# curl https://nixos.org/nix/install | sh

# Source the bash profile files again as nix installation adds
# some lines to the bash profile
source $HOME/.config/bash/bash_profile
source $HOME/.profile
source $HOME/.bashrc

# Setup sourcing of bash_profile and bashrc in bashrc
echo ". $HOME/.config/bash/bash_profile" >> $HOME/.bashrc
echo ". $HOME/.config/bash/bashrc" >> $HOME/.bashrc

PACKAGE_LIST="tmux neovim keychain ripgrep fzf fish alacritty cscope clang llvm"

# Install all packages that are commonly used
if [ -x "$(command -v pacman)" ]; then
	sudo pacman -Sy --noconfirm $PACKAGE_LIST
elif [ -x "$(command -v dnf)" ]; then
	sudo dnf check-update
	sudo dnf install -y --skip-broken $PACKAGE_LIST
else
	echo "This is not an Arch or Fedora based distribution. Please modify install script accordingly"
fi

# Install pip packages
if [ -x "$(command -v pip)" ]; then
	pip install --user neovim powerline-status compiledb
else
	echo "pip is not installed in the user path"
	exit 1
fi

# Install node and yarn for coc.nvim
curl -sL install-node.now.sh/lts | sudo sh
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

# Setup symbolic links
# Put a symoblic link to fish in $HOME/.local/bin - this is the expected
# path to fish in tmux configuration
ln -s /usr/bin/fish $HOME/.local/bin/fish

# Install symbolic links to the pip powerline scripts
ln -s ~/.local/lib/python3.8/site-packages/powerline/bindings/tmux ~/.config/tmux/tmux-powerline
ln -s ~/.local/lib/python3.8/site-packages/powerline ~/.config/fish/powerline

# Install pure theme for fish
curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
source /tmp/pure_installer.fish; and install_pure

# Install all the neovim plugins
echo "Installing neovim plugins"
# Install vimplug plugin manager for neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# Install the tmux plugins
echo "Install tmux plugins"

# Install tmux plugin manager - tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux start-server
tmux new-session -d
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux kill-server

