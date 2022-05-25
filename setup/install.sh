#!/usr/bin/env bash
sudo apt-get update

# install tmux, vim, neovim, ninja, cmake, pip, htop, unzip
sudo apt-get -y install tmux vim neovim ninja-build cmake pip htop unzip

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
chmod u+x ccache
