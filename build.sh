#!/bin/bash
###################
# Build / deploy script
# Meant to be called by devops builder
###################

export HERE=$(pwd)

COMMIT_MSG=$1
if [ -z "$COMMIT_MSG" ]; then
    # default commit message
    COMMIT_MSG='New deployment'
fi

TMP_FOLDER=$(mktemp -d)
TMP_FOLDER2=$(mktemp -d)

cd $TMP_FOLDER
echo "Fetching services / providers details"
git clone --branch docs git@github.com:devo-ps/devops-ansible.git

#
# Copy wiki to manual
#
cd devops-ansible
cp -a * $HERE/source/

#
# Prepare the menu data file
#
cd $HERE
# python build/prepare_menu.py
mkdir public
make build

# Copy build files
cp -a _site/* $TMP_FOLDER2

# Stash changes to allow branch switch
git stash
git checkout gh-pages
git clean -f -d
git clean -f -x
git pull
cp -a $TMP_FOLDER2/* .
git add .
git commit -am "$COMMIT_MSG"
git push

# Cleanup
rm -rf $TMP_FOLDER
rm -rf $TMP_FOLDER2
