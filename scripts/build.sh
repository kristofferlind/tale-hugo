#! /bin/bash
set -eu

pwd
rm -rf ./public
hugo --minify
