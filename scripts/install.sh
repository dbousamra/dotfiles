#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

sh setup/brews.sh
sh setup/casks.sh

zsh
git clone --recursive https://github.com/davidvuong/prezto "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ~/.zprezto/zsh_nocorrect ~/zsh_nocorrect

chsh -s /bin/zsh
source ~/.zshrc

mkdir ~/.nvm
cp $(brew --prefix nvm)/nvm-exec ~/.nvm/

source ~/.zshrc

nvm install v5.1.0
nvm alias default v5.1.0

ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -s ~/dotfiles/vim/ideavim ~/.ideavim

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

sh setup/npm.sh
sh setup/apm.sh

~/dotfiles/atom/config.cson ~/.atom/
~/dotfiles/atom/keymap.cson ~/.atom/
~/dotfiles/atom/snippets.cson ~/.atom/
~/dotfiles/atom/styles.less ~/.atom/

pip install --upgrade pip
sudo pip install -r ~/dotfiles/setup/requirements.txt

ln -s ~/dotfiles/git/gitignore ~/.gitignore
ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/dircolors ~/.dircolors

echo "Successfully install davidvuong/dotfiles!";
