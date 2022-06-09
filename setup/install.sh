#!/usr/bin/env bash

# zsh and oh-my-zsh should be set up before running this script.

sudo apt-get update

# install tmux, vim, neovim, ninja, cmake, pip, htop, unzip, ncdu
sudo apt-get -y install tmux vim neovim ninja-build cmake pip htop unzip ncdu

# install fzf
mkdir -p ~/Programs/
cd ~/Programs
git clone --depth 1 https://github.com/junegunn/fzf.git fzf
yes | fzf/install

# install ccache
mkdir -p ~/Programs/ccache
cd ~/Programs/ccache
git clone https://github.com/ccache/ccache.git src
mkdir -p obj inst
cd obj
cmake -G Ninja ../src -DZSTD_FROM_INTERNET=On -DHIREDIS_FROM_INTERNET=On -DCMAKE_INSTALL_PREFIX=../inst
ninja install
mkdir -p ~/Programs/bin
cd ~/Programs/bin
ln -s ~/Programs/ccache/inst/bin/ccache
