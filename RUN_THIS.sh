cd ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
git submodule update --init --recursive --remote
sh update_plugins.sh
cd bundle/YouCompleteMe/
# No rust-completer
python3 install.py --clangd-completer --cs-completer --go-completer --ts-completer --java-completer
# python3 install.py --all
