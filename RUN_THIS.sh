cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive --remote
cd bundle/YouCompleteMe/
sudo python3 install.py
