#!/bin/bash

# Update the .vimrc in the git repo with the latest active version.

fname=".vimrc.$(date +%s).bak"

echo "Copying ./.vimrc to $fname"
cp ./.vimrc $fname

echo "Deleting ./.vimrc"
rm ./.vimrc

echo 'Copying ~/.vimrc to .'
cp ~/.vimrc .

git status

echo 'Done.'
