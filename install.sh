#!/bin/sh

echo "Setting up your dev environment..."

apt-get install -y zsh apt-utils
echo zsh --version
chsh -s $(which zsh)

rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

add-apt-repository ppa:aacebedo/fasd
apt-get update
apt-get install fasd

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
