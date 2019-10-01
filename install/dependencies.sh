#!/bin/bash

set -e

DOTFILES_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && cd ../ && pwd)"

echo "Installing system dependencies..."
echo "DOTFILES_DIR=${DOTFILES_DIR}"

function installNode () {
  # Install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  nvm install lts/*
}

function installMacPrograms () {
  echo "Installing macOS dependencies..."

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor

  # Install zsh
  brew install \
    zsh \
    zsh-completions \
    awscli \
    diff-so-fancy \
    bat

  brew install yarn --without-node
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

  brew upgrade

  installNode
}

function installLinuxPrograms () {
  echo "Installing Linux dependencies..."

  sudo apt-get update
  sudo apt-get install -y \
    git \
    curl \
    zsh \
    yarn \
    ruby \
    ruby-dev \
    vim \
    python3.6 \
    python-pip

  sudo apt upgrade

  installNode
  npm i -g diff-so-fancy

  # Enable right click on touch pad
  gsettings set org.gnome.desktop.peripherals.touchpad click-method areas

  # Remap caps lock to CTRL
  gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"
}

function main () {
  echo "Installing..."

  local SYSTEM="$(uname)"

  case ${SYSTEM} in
  'Darwin')
    echo "MacOS detected, installing programs for Mac..."
    installMacPrograms
    ;;
  'Linux')
    # assume Ubuntu for now
    echo "Linux detected, installing programs for Linux..."
    #installLinuxPrograms
    ;;
  *)
    echo "${SYSTEM} is not supported"
  esac

  echo "Fetching antigen..."
  curl -L git.io/antigen > antigen.zsh

  echo "Linking dotfiles..."
  # iterate through all files
  # and symlink them to home
  for filename in $(ls -A); do
    echo "File name: ${filename}"
    if [ ${filename} != ".git" ]; then
      if [[ ${filename} = .* ]]; then
        echo "Linking ${filename} to ~/${filename}"
        ln -nsf ${DOTFILES_DIR}/${filename} ~/${filename}
      fi
    fi
  done

  echo "Linking antigen.zsh to ~/antigen.zsh"
  ln -nsf ${DOTFILES_DIR}/antigen.zsh ~/antigen.zsh

  echo "Installing vim-plugin..."
  # Install vim-plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  echo "Installing vim plugins..."
  # Install vim plugins
  vim +PlugInstall +PlugUpdate +qall

  source ~/.zshrc

  echo "Completed installation!"
}

main
