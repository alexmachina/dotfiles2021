#!/bin/bash

# Get my dotfiles folder directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

INIT_VIM=~/.config/nvim/init.vim
TMUX_CONF=~/.tmux.conf

function linkDotfiles {
  # Link init.vim
  echo "Linking init.vim..."
  if [ -f "$INIT_VIM" ]; then
    cp $INIT_VIM ~/.config/nvim/init.vim.bkp
    rm $INIT_VIM
  fi

  ln -s $DIR/init.vim ~/.config/nvim/init.vim

  # Link .tmux.conf
  echo "Linking .tmux.conf..."
  if [ -f "$TMUX_CONF" ]; then
    cp $TMUX_CONF ~/.tmux.conf.bkp
    rm $TMUX_CONF
  fi

  ln -s $DIR/tmux.conf ~/.tmux.conf
}

function addSourceToRc {
  local line="source ${DIR}/index.sh"
  local isInFile=$(cat ~/.bashrc | grep -c "$line")
  
  echo "isInFile $isInFile"

  if [ $isInFile -eq 0 ]; then
    echo "sourcing index.sh in bashrc"
    echo $LINE >> ~/.bashrc
    source ~/.bashrc
  else
    echo "dotfiles already sourced!"
  fi
}

function installVimPlugins {
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim +PlugInstall +qall
}

linkDotfiles
installVimPlugins
addSourceToRc

echo "Bootstraping complete!"
