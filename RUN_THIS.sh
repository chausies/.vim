cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive
cd bundle/YouCompleteMe/
python3 install.py --all
