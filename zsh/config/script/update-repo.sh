GIT_REPO=$(basename $(git rev-parse --show-toplevel))

git add --all
git commit -m 'Update'
git push git@github.com:$USER/$GIT_REPO.git

