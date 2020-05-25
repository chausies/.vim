cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive --remote --merge
cd bundle/YouCompleteMe/
python3 install.py --all
