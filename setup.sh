#! /bin/bash

# Neovim
rm -rf ~/.config/nvim
ln -s $PWD/nvim ~/.config/
nvim -c "PackerSync"

# Tmux
rm ~/.tmux.conf
ln -s $PWD/tmux/tokyonight.conf ~/.tmux.conf
