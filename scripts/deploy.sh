#! /bin/bash

set -eux

# executed from root, ./scripts/deploy.sh (check pipeline for example)

DEFAULT_REPO_URL="$(git config --get remote.origin.url)"
DEFAULT_BUILD_PATH="./public"
ROOT_DIR=$(pwd)

echo "$DEFAULT_REPO_URL"

REPO_URL="${DEPLOY_REPO_URL:-$DEFAULT_REPO_URL}"
BUILD_PATH="${DEPLOY_BUILD_PATH:-$DEFAULT_BUILD_PATH}"

cd $BUILD_PATH
git init .
git remote add deploy-repo $REPO_URL
git checkout -b gh-pages
git add -A

IS_GITHUB_REPO=$(echo "$REPO_URL" | grep -c "github.com")

if [[ $IS_GITHUB_REPO && -f "$ROOT_DIR/config.toml" ]]; then
  echo `cat $ROOT_DIR/config.toml | grep "baseURL" | cut -d "=" -f 2`
  BASE_URL=$(cat $ROOT_DIR/config.toml | grep "baseURL" | cut -d "=" -f 2 | tr -d "' ")

  # remove protocol
  BASE_URL=${BASE_URL/https:\/\//''}
  BASE_URL=${BASE_URL/http:\/\//''}

  # cut last slash and write CNAME file
  echo "$BASE_URL" | rev | cut -c 2- | rev > CNAME
  cat CNAME
fi

if [ -z "$(git config user.email)" ]; then
  git config user.email "deployer"
fi

if [ -z "$(git config user.name)" ]; then
  git config user.name "Deployer"
fi

git commit -m "Deploy"
git push deploy-repo --force
rm -rf .git
