#!/bin/sh

echo "Setting up your dev environment..."

apt-get update
apt-get install -y zsh apt-utils

rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/vscode/tasks.json $HOME/.config/Code/User/tasks.json

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
