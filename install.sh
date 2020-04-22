#!/bin/sh

# Script to do basic setup of the custom configuration that is common among my systems
rsync -av . $PWD $HOME/.config
cd $HOME/.config

ln -s $HOME/.config/gitconfig/git-config $HOME/.gitconfig
ln -s $HOME/.config/bash/bash_profile $HOME/.bash_profile
ln -s $HOME/.config/tmux/tmux.conf $HOME/.tmux.conf
ln -s $HOME/.config/tmux $HOME/.tmux

# Source the bash profile files again as nix installation adds
# some lines to the bash profile
source $HOME/.config/bash/bash_profile
source $HOME/.profile
source $HOME/.bashrc

# Setup sourcing of bash_profile and bashrc in bashrc
echo ". $HOME/.config/bash/bash_profile" >> $HOME/.bashrc
echo ". $HOME/.config/bash/bashrc" >> $HOME/.bashrc

REPO_PACKAGE_LIST="tmux neovim fzf fish cscope clang llvm tig clangd"

# Install all packages that are commonly used
if [ -x "$(command -v pacman)" ]; then
	sudo pacman -Sy --noconfirm $REPO_PACKAGE_LIST
elif [ -x "$(command -v dnf)" ]; then
	sudo dnf check-update
	sudo dnf install -y --skip-broken $REPO_PACKAGE_LIST
elif [ -x "$(command -v apt-get)" ]; then
	sudo apt-get update
	sudo apt-get install -y $REPO_PACKAGE_LIST
	sudo apt-get install -y python3-pip
else
	echo "This is not an Arch or Fedora based distribution. Please modify install script accordingly"
fi

PIP_PACKAGE_LIST="neovim powerline-status compiledb"
# Install pip packages
if [ -x "$(command -v pip3)" ]; then
	pip3 install --user $PIP_PACKAGE_LIST
else
	echo "pip is not installed in the user path"
	exit 1
fi

# Install node and yarn for coc.nvim
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

# Setup symbolic links
# Put a symoblic link to fish in $HOME/.local/bin - this is the expected
# path to fish in tmux configuration
ln -s /usr/bin/fish $HOME/.local/bin/fish

# Install symbolic links to the pip powerline scripts
ln -s ~/.local/lib/python3.8/site-packages/powerline/bindings/tmux ~/.config/tmux/tmux-powerline
ln -s ~/.local/lib/python3.8/site-packages/powerline ~/.config/fish/powerline

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

# Install RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

CARGO_PACKAGE_LIST="ripgrep"
cargo install $CARGO_PACKAGE_LIST

# Install pure theme for fish
fish <<'END_FISH'
	curl git.io/pure-fish --output /tmp/pure_installer.fish --location --silent
	source /tmp/pure_installer.fish; and install_pure
END_FISH

# Install nix-env
# curl https://nixos.org/nix/install | sh
