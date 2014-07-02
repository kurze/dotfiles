#!/bin/sh

cd $HOME


echo Configuration de Vim

ln  -sb dotfiles/.vimrc.local  .
ln  -sb dotfiles/.vimrc.before.local  .

curl http://j.mp/spf13-vim3 -L -o - | sh

echo Configuration de zsh

ln -sb dotfiles/.zsh .
ln -sb dotfiles/.zshrc .

echo Configuration de tmux

ln -sb dotfiles/.tmux.conf .
cd /tmp/

git clone https://github.com/thewtex/tmux-mem-cpu-load
cd tmux-mem-cpu-load

cmake .
make
sudo make install

cd ..
rm -fr tmux-mem-cpu-load
