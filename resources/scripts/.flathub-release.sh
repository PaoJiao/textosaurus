#!/bin/bash

# This script will pull Flathub/Textosaurus repo
# and push new appdata/flatpak-json to new branch.
echo "flathub"

commit_hash=$(git rev-parse HEAD)
tag=$TRAVIS_TAG
json_file="io.github.martinrotter.textosaurus.json"

git clone https://martinrotter:${GH_TOKEN}@github.com/flathub/io.github.martinrotter.textosaurus.git ./flathub
cd flathub
git checkout -b new-version

# Replace old commit hash and branch.
cat "$json_file" | sed -e "s@\"branch\": \".\+\"@\"branch\": \"$tag\"@g" > "$json_file"
cat "$json_file" | sed -e "s@\"commit\": \".\+\"@\"commit\": \"$commit_hash\"@g" > "$json_file"

cat "$json_file"