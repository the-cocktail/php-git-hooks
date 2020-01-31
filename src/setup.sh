#!/bin/sh

if [ -e .git/hooks/pre-commit ];
then
    PRE_COMMIT_EXISTS=1
else
    PRE_COMMIT_EXISTS=0
fi

if [ ! -d .git/hooks ]; then
  mkdir -p .git/hooks
fi

cp vendor/the-cocktail/php-git-hooks/src/pre-commit .git/hooks/pre-commit
cp vendor/the-cocktail/php-git-hooks/src/pre-push .git/hooks/pre-push

chmod +x .git/hooks/pre-commit
chmod +x .git/hooks/pre-push

if [ "$PRE_COMMIT_EXISTS" = 0 ];
then
    echo "Pre-commit and Pre-push git hooks are installed!"
else
    echo "Pre-commit and Pre-push git hooks are updated!"
fi
