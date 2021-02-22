#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Load bash scripts
source $DIR/scripts/wsl_defaults.sh
source $DIR/scripts/bash_it_defaults.sh
source $DIR/scripts/nvm.sh
source $DIR/scripts/adda.sh
source $DIR/scripts/env.sh
source $DIR/scripts/fzf.sh
source $DIR/scripts/git-become.sh


# Load aliases
source $DIR/aliases

