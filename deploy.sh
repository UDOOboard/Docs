#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# Compile
composer install
composer generate

# go to the out directory and create a *new* Git repo
cd static
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "social@udoo.org"

# Add drivers and tools
cp -rp ../driversandtools ../img .

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
echo "Deploying"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
#git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages

sleep 10

echo "Updating UDOO.org"
curl -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; de; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3" "https://www.udoo.org/wp-content/plugins/neo-docs/update.php?repo=docs&t=$TKX" 2>&1
