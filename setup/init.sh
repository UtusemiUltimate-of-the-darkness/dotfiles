#!/bin/bash

bash ~/dotfiles/setup/symlink.sh

#install brew
if ! which brew ; then
  if [ $(uname -s) = "Darwin" ]; then
    ln -s -f ~/dotfiles/setup/Brewfile ~
    echo "Installing Homebrew ..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew tap Homebrew/bundle
    brew bundle
  elif [ $(uname -s) = "Linux" ]; then
    sudo apt-get install curl git ruby zsh
    echo "Do you want to install newest \"vim with lua\" ? [y/n]:"
    read answer
    if [ $answer = "y" ]; then
      sudo apt-get install mercurial ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev
      wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
      tar xjf vim-7.4.tar.bz2
      cd vim74
      ./configure \
        --with-features=huge \
        --enable-multibyte \
        --enable-luainterp=dynamic \
        --enable-gpm \
        --enable-cscope \
        --enable-fontset \
        --enable-fail-if-missing \
        --prefix=/usr/local
      make && make install
    else
      sudo apt-get install vim
    fi
  else
    echo "Not support your OS"
  fi
fi

echo "Change shell to zsh, please put ypur password"
[ $SHELL = "/bin/zsh" ] || chsh -s /bin/zsh
exit
