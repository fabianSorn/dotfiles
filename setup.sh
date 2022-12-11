#! /bin/bash

# Neovim
rm -rf ~/.config/nvim
ln -s $PWD/nvim ~/.config/

# Vrapper (Vim eclipse plugin)
rm -rf ~/.vrapperrc
ln -s $PWD/vrapper/.vrapperrc ~/.vrapperrc

# Tmux
rm ~/.tmux.conf
ln -s $PWD/tmux/tokyonight.conf ~/.tmux.conf
