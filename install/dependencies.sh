set -e

echo "Installing system dependencies..."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install zsh
brew install zsh zsh-completions
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm install lts/*

# Install yarn
brew install yarn --without-node

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install vim plugins
vim +PlugInstall +qall

# Build the command-t Vim plugin
# See: https://github.com/wincent/command-t/blob/master/doc/command-t.txt
cd ~/.vim/plugged/Command-T/ruby/command-t/ext/command-t
ruby extconf.rb
make
cd -

# Install aws CLI
brew install awscli

# Install diff-so-fancy
brew install diff-so-fancy

# Install cat alternative - bat
brew install bat
