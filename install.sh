#!/bin/bash

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

# Load all git dependencies
cd $DOTFILES_DIR
git submodule init
git submodule update
git submodule sync

# Setup NodeJS
source "$DOTFILES_DIR/3rdparty/nvm.git/nvm.sh"
CURRENT_NODEJS_VERSION=`cat "$DOTFILES_DIR/nodejs/CURRENT_VERSION"`
nvm install v$CURRENT_NODEJS_VERSION
nvm use v$CURRENT_NODEJS_VERSION
if [ "x$NVM_BIN" = "x" ]; then
    wget http://tulip.hadiko.de/xhochy/nodejs/build/amd64/libssl.so.1.0.0 -O $DOTFILES_DIR/nodejs/lib/libssl.so.1.0.0
    wget http://tulip.hadiko.de/xhochy/nodejs/build/amd64/libcrypto.so.1.0.0 -O $DOTFILES_DIR/nodejs/lib/libcrypto.so.1.0.0
    wget http://tulip.hadiko.de/xhochy/nodejs/build/amd64/libc-2.15.so -O $DOTFILES_DIR/nodejs/lib/libc.so.6
    wget http://tulip.hadiko.de/xhochy/nodejs/build/amd64/node-$CURRENT_NODEJS_VERSION -O $DOTFILES_DIR/nodejs/bin/node
    chmod +x DOTFILES_DIR/nodejs/bin/node
    export LD_LIBRARY_PATH="$DOTFILES_DIR/nodejs/lib:$LD_LIBRARY_PATH"
    export PATH="$DOTFILES_DIR/nodejs/bin:$PATH"
    curl http://npmjs.org/install.sh | sh
fi

# Setup CoffeeScript and other dependencies
npm install -g coffee-script
npm install -g muffin
npm install

# Initially run 'cake update' to link everything
cake update
