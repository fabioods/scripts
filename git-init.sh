#!/bin/bash

echo "Initializing git repository"
echo "Enter the repository name:"
read repo_name

echo "git init"
git init
echo "git config user.email \"fah_ds@live.com\""
git config user.email "fah_ds@live.com"
echo "git config user.name \"Fabio dos santos\""
git config user.name "Fabio dos santos"
echo "git remote add origin github-fabio:fabioods/$repo_name.git"
git remote add origin github-fabio:fabioods/$repo_name.git

echo "Repository created"

echo "Would you like to create readme? [y/n]"
read readme_answer
if  [[ $readme_answer  == 'y' || $readme_answer == 'Y' ]]; 
then
  echo "Creating readme"
  npx readme-md-generator
  echo "Readme created"
fi

if [ -f "./README.md" ]; then
  echo "Creating commit to readme"
  git add README.md
  echo "Creating commit to readme"
  git commit -m "doc: add readme" --no-verify
  echo "Pushing readme to github"
  git push -u origin main
  echo "Pushed to github"
fi

echo "- repo: https://github.com/pre-commit/mirrors-prettier
  rev: \"\" 
  hooks:
    - id: prettier" > .pre-commit-config.yaml

echo "Creating pre-comit file"
git add .
echo "Creating commit to precommit file"
git commit -m "setup: add pre-commit file"
git add .
git commit -m "setup: add pre-commit file"

echo "Finished repository initialization"

echo "Opening repository in VsCode"
code .

