#!/bin/sh

echo "Setting up your dev environment..."

apt-get update
apt-get install -y zsh apt-utils

rm -rf $HOME/.zshrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

code --install-extension will-wow.vscode-alternate-file
code --install-extension github.vscode-pull-request-github
code --install-extension eamodio.gitlens
code --install-extension ms-vsliveshare.vsliveshare

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
