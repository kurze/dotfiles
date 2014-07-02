#!/bin/sh

cd $HOME


echo Vim Configuration

ln  -sb dotfiles/.vimrc.local  .
ln  -sb dotfiles/.vimrc.before.local  .

curl http://j.mp/spf13-vim3 -L -o - | sh

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
