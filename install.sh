#!/bin/bash

# Install Xcode
# 
#   Would be better to install this
#   from the app store, because you need to 
#   accept an agreement first. 
#   xcode-select --install

echo "Starting a fresh install..."

# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update brew
brew doctor
brew update

# Install Homebrew cask
brew tap phinze/homebrew-cask
brew install brew-cask

# Install essentials
PACKAGES=(
  findutils
  git
  postgresql
  redis
  tomcat
  httpd
  php70
  php56
  php70-mcrypt
  mysql
  rbenv
  wget
  ssh-copy-id
  elasticsearch
  dotnet
  dotnet-sdk
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

CASKS=(
  visual-studio-code
  google-chrome
  firefox
  slack
  iterm2
  skype
)

echo "Installing casks..."
brew cask install ${CASKS[@]}

