#!/bin/sh

echo "Setting up your dev environment..."

apt-get update
apt-get install -y zsh apt-utils vim

rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
