#!/bin/sh

# Use python2 if there multiple pythons available
PYTHON=$(which python)
if [ $PYTHON = "/usr/bin/python" ]; then
  if [ -x /usr/bin/python2 ]; then
    PYTHON=/usr/bin/python2
  fi
fi

export PYTHON

# Get the diretory my dotfiles repo is in.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ] ; do SOURCE="$(readlink "$SOURCE")"; done
DOTFILES_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Setup NodeJS
source "$DOTFILES_DIR/3rdparty/nvm.git/nvm.sh"
CURRENT_NODEJS_VERSION=`cat "$DOTFILES_DIR/nodejs/CURRENT_VERSION"`
nvm install v$CURRENT_NODEJS_VERSION
nvm use v$CURRENT_NODEJS_VERSION

# Setup CoffeeScript
npm install -g coffee-script
