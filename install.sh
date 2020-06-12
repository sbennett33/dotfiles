#!/bin/sh

echo "Setting up your dev environment..."

apt-get install -y zsh
zsh --version
chsh -s $(which zsh)
