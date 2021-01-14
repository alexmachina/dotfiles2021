#!/bin/bash

# Get my dotfiles folder directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

INIT_VIM=~/.config/nvim/init.vim

function linkDotfiles {
  # Link init.vim
  echo "Linking init.vim..."
  if [ -f "$INIT_VIM" ]; then
    cp $INIT_VIM ~/.config/nvim/init.vim.bkp
    rm $INIT_VIM
  fi

  ln -s $DIR/init.vim ~/.config/nvim/init.vim
}

linkDotfiles

echo "adding dotfiles index.sh to bashrc"

LINE="source ${DIR}/index.sh"
echo $LINE >> ~/.bashrc
source ~/.bashrc

echo "Bootstraping complete!"
