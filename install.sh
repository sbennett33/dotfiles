#!/bin/sh

echo "Setting up your dev environment..."

apt-get update
apt-get install -y zsh apt-utils vim

rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

wget https://github.com/git/git/archive/v2.24.3.tar.gz
tar -zxf v2.24.3.tar.gz
cd git-2.24.3 && \
    make prefix=/usr/local all && \
    make prefix=/usr/local install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
