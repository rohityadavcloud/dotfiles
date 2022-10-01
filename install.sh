#!/bin/sh

set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo Installing dotfiles from $DIR

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp zsh-themes/* ~/.oh-my-zsh/themes/

ln -sf $DIR/bin ~/bin
ln -sf $DIR/aliasrc ~/.aliasrc
ln -sf $DIR/dir-colors ~/.dircolors
ln -sf $DIR/zshrc.zsh ~/.zshrc
ln -sf $DIR/bashrc ~/.bashrc
ln -sf $DIR/vimrc ~/.vimrc
ln -sf $DIR/vim ~/.vim
ln -sf $DIR/irssi ~/.irssi
ln -sf $DIR/muttrc ~/.muttrc
ln -sf $DIR/muttrc-colors ~/.muttrc-colors
ln -sf $DIR/git/gitconfig ~/.gitconfig
ln -sf $DIR/git/gitmessage ~/.gitmessage
