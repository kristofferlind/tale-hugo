#! /bin/bash
set -eux

echo "$(pwd)"
rm -rf ./public
hugo --minify
