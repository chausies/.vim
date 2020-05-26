cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
sh update_plugins.sh
cd bundle/YouCompleteMe/
sudo python3 install.py --all
