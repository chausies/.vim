cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive
cd bundle/YouCompleteMe/
./install.py --clang-completer
