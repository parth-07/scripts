# configure tmux
wget -O "${HOME}/.tmux.conf" https://gist.githubusercontent.com/parth-07/37c028e1862c3f23eee1335ba2e49d4a/raw/27775dd06f22041c61804fbe4cabf761ef912611/.tmux.conf

# configure vim
wget -O "${HOME}/.vimrc" https://gist.githubusercontent.com/parth-07/184b3081fbe38eb81fdd1981f3603b6d/raw/d4bd9a83d85fb3ff8640f616fe4bd46007e09251/.vimrc

# [interactive] locale configuration
sudo locale-gen "en_IN.UTF-8"
sudo dpkg-reconfigure locales

# configure ccache
cd ~/Programs/bin
ln -s ccache g++
ln -s ccache gcc
ln -s ccache clang-11
ln -s ccache clang++-11