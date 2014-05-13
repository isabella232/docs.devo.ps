#!/bin/bash
###################
# Build / deploy script
# Meant to be called by devops builder
###################

HERE=$(pwd)

COMMIT_MSG=$1
if [ -z "$COMMIT_MSG" ]; then
    # default commit message
    COMMIT_MSG='New deployment'
fi

TMP_FOLDER=$(mktemp -d)

cd $TMP_FOLDER

#
# Fetch wiki
#
echo "Fetching docs wiki"
git clone git@github.com:devo-ps/docs.devo.ps.wiki.git
echo "Fetching services details"
git clone git@github.com:devo-ps/devops-ansible.git

#
# Copy wiki to manual
#
cd docs.devo.ps.wiki
cp * $HERE/manual

#
# Copy services files to references
#
cd ../devops-ansible
# copy 
function copy {
    file="$1"
    dir=$(dirname $file)
    base=$(basename $file \.yml)

    newname=$(echo $dir | cut -f4 -d'/')

    cp $file $HERE/references/$newname.md
}
export -f copy

find packages -name configuration.md -exec bash -i -c 'copy {}' \;

#
# Prepare the menu data file
#
cd $HERE
python build/prepare_menu.py


# # Stash changes to allow branch switch
# git stash
# git checkout gh-pages
# cp -a $TMP_FOLDER/* .
# git add .
# git commit -am "$COMMIT_MSG"
# git push

# # Cleanup
# rm -rf $TMP_FOLDER
