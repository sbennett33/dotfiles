#!/bin/sh

echo "Setting up your dev environment..."

apt-get install -y zsh apt-utils
echo zsh --version
chsh -s $(which zsh)

rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

git submodule update

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
