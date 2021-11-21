#! /bin/bash
set -eu

rm -rf ./public
hugo --minify

# pre-compress with brotli
find ./public -type f \
  | grep -e ".html$" -e ".css$" -e ".xml" -e ".js$" \
  | xargs brotli -9 --force --verbose
