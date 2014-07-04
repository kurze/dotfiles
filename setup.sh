#!/bin/sh

cd $HOME


echo Vim Configuration

ln  -sb dotfiles/.vimrc.local  .
ln  -sb dotfiles/.vimrc.before.local  .
ln  -sb dotfiles/.vimrc.bundles.local  .

curl http://j.mp/spf13-vim3 -L -o - | sh
# install all bundles, no choice (2014-07-04); https://github.com/spf13/spf13-vim/pull/503

# correct bundle list
vim +BundleInstall +BundleClean +qall

echo Zsh Configuration

ln -sb dotfiles/.zsh .
ln -sb dotfiles/.zshrc .

echo Tmux Configuration

ln -sb dotfiles/.tmux.conf .
cd /tmp/

git clone https://github.com/thewtex/tmux-mem-cpu-load
cd tmux-mem-cpu-load

cmake .
make
sudo make install

cd ..
rm -fr tmux-mem-cpu-load
