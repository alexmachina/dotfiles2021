#!/bin/bash
# TODO: Change function names to snake case
# TODO: 

# Get my dotfiles folder directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

INIT_VIM=~/.config/nvim/init.vim
TMUX_CONF=~/.tmux.conf
GIT_CONFIG=~/.gitconfig

# TODO: Create a helper function.
# link_file source destiny
# The three operations are similar, they:
# 1. Check if file exist
# 2. Create a backup file
# 3. remove the old file
# 4. create a link to dotfile
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

   # Link .gitconfig
  echo "Linking .gitconfig..."
  if [ -f "$GIT_CONFIG" ]; then
    cp $GIT_CONFIG ~/.gitconfig.bkp
    rm $GIT_CONFIG
  fi

  ln -s $DIR/gitconfig ~/.gitconfig
}

function addSourceToRc {
  local line="source ${DIR}/index.sh"
  local isInFile=$(cat ~/.bashrc | grep -c "$line")


  if [ $isInFile -eq 0 ]; then
    echo "sourcing index.sh in bashrc"
    echo $line >> ~/.bashrc
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

function installBashIt {
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it

  ~/.bash_it/install.sh
}

linkDotfiles
installVimPlugins
installBashIt
addSourceToRc

echo "Bootstraping complete!"
