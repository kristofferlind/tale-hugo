#! /bin/bash
set -eu

rm -rf ./public
hugo --minify
