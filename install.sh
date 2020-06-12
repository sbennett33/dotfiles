#!/bin/sh

echo "Setting up your dev environment..."

apt-get install -y zsh
echo zsh --version
chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
