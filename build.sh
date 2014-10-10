#!/bin/bash
###################
# Build / deploy script
# Meant to be called by devops builder
###################

COMMIT="$COMMIT"
MAIL="$EMAIL"
DEST="$DEST"

# Set defaults
[ -z "$DEST" ] && DEST='gh-pages'

TMP_FOLDER=$(mktemp -d)

echo -n "Running the build process... " >&2
make build
[ $? -eq 0 ] && echo "Success." >&2 || echo "Failed." >&2

echo "Copying build result..." >&2
cp -a _site $TMP_FOLDER 

echo "Resetting git repository and swithing branch..."  >&2
git reset --hard && git checkout $DEST

echo "Emptying destination branch, and populating with new build..." >&2
git rm -r --ignore-unmatch * && cp -a $TMP_FOLDER/* .

echo "Adding new build and pushing result to GitHub" >&2
git add . && git commit -am "Build triggered by commit $COMMIT from $EMAIL" && git push origin $DEST

echo "Removing build folder..." >&2
rm -rf $TMP_FOLDER
