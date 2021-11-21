#!/bin/bash

set -eux

# versions
HUGO_VERSION="0.88.1"

# paths
TEMP_PATH="./temp"
BIN_PATH="/usr/local/bin"

mkdir -p $TEMP_PATH

# install hugo
if ! hash hugo 2>/dev/null || ! hugo version | grep -q "$HUGO_VERSION"; then
  curl -LO https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
  tar -C $TEMP_PATH -xzf hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
  sudo mv $TEMP_PATH/hugo $BIN_PATH/hugo
  rm -rf $TEMP_PATH
  rm hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
fi

# install brotli
sudo apt install brotli -y

# check installations
hugo version
brotli --version
