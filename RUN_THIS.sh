cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive
git submodule update --init --recursive --remote
git submodule update --init --recursive
cd bundle/YouCompleteMe/
sudo python3 install.py
