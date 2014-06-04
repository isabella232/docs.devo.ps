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
TMP_FOLDER3=$(mktemp -d)

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
mkdir -p $HERE/source/manual
cp * $HERE/source/manual

#
# Copy services files to references
#
cd ../devops-ansible
# copy 
function copy() {
    file="$1"
    dir=$(dirname $file)
    base=$(basename $file \.yml)

    newname=$(echo $dir | cut -f2 -d'/')

    cp $file $HERE/source/references/$newname.md
}
export -f copy

find packages -name configuration.md -exec bash -i -c 'copy {}' \;

#
# Prepare the providers' details iun devops-ansible
#
cd provider-build
sudo pip install -r requirements.txt
python providers.py $TMP_FOLDER3 /home/devops/providers_config.json
for provider_file in $(ls $TMP_FOLDER3/*)
do  
  base=$(basename $provider_file)
  cp $provider_file $HERE/source/references/$basename.md
  echo '
template: provider.html
---
' >> $HERE/source/references/$basename.md
done


#
# Prepare the menu data file
#
cd $HERE
python build/prepare_menu.py
make build

# Copy build files
cp -a _site/* $TMP_FOLDER2

# Stash changes to allow branch switch
git stash
git checkout gh-pages
git clean -f -d
git clean -f -x
cp -a $TMP_FOLDER2/* .
git add .
git commit -am "$COMMIT_MSG"
git push

# Cleanup
rm -rf $TMP_FOLDER
rm -rf $TMP_FOLDER2
rm -rf $TMP_FOLDER3
