#!/usr/bin/env bash

set -eux

PDF_FILE="build/thesis.pdf"
TAG=$(date +'%Y.%m.%d-%H.%M.%S')
DATE=$(date +'%Y/%m/%d %H:%M:%S')

if [ $GITHUB_REF = 'master' ]; then
  PRERELEASE=''
else
  PRERELEASE='--prerelease'
fi

git remote set-url origin https://itochan:${GITHUB_TOKEN}@github.com/itochan/thesis.git

git tag $TAG
git push --tags
echo "New tag: $TAG"

echo "Cleaning up under build/"
find build/* ! -name "*.pdf" ! -name "*.xml" | xargs rm -rf

echo "Uploading artifacts"
$GHR -n "$DATE" $PRERELEASE --delete --replace "$TAG" build
