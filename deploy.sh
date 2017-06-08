#!/usr/bin/env bash

echo "Cleaning the dist directory"
rm -rf ./dist

echo "Exporting to dist directory"
rsync -av --exclude="node_modules" --exclude="dist" --exclude=".gi*" --exclude="*~" --exclude="deploy.sh" . dist

echo "Uploading"
s3cmd sync dist/ s3://tsmithwidgets
