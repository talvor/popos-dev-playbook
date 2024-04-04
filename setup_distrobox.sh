#!/bin/bash

./scripts/install_packages.sh ./packages/distrobox.txt

mkdir -p $HOME/.local/share/zsh
if [ ! -f $HOME/.local/share/zsh/antigen.zsh ]; then
	echo "Installing antigen"
	curl -L git.io/antigen >$HOME/.local/share/zsh/antigen.zsh
fi

if ! [ -x "$(command -v nvm)" ]; then
	# Install node version manager
	echo "Installing nvm"
	curl -sS https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | sh
fi

if ! [ -x "$(command -v starship)" ]; then
	# Install starship
	echo "Installing starship"
	curl -sS https://starship.rs/install.sh | sh
fi

mkdir -p $HOME/.tmux
if [ ! -d $HOME/.tmux/plugins ]; then
	# Install tmux plugin manager
	echo "Installing tpm"
	mkdir -p $HOME/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if ! [ -x "$(command -v lazygit)" ]; then
	# Install lazygit
	echo "Installing lazygit"
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
fi
