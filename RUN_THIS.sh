cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive --remote
sh update_plugins.sh
cd bundle/YouCompleteMe/
sudo python3 install.py --all
