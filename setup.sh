#!/usr/bin/env bash

PIP_CMD=$(which pip3)
if [ -z "$PIP_CMD" ]; then
	echo "Pip not found, please install Python and try again!"
	exit 1
fi

PIPENV_CMD=$(which pipenv)
if [ -z "$PIPENV_CMD" ]; then
	echo "pipenv not found, installing..."
	$PIP_CMD install pipenv
	PIPENV_CMD=$(which pipenv)
fi

echo "Installing dependencies..."
$PIPENV_CMD install --dev

echo "Setting up git hooks..."
if [ -f ".git/PROJECT_INITIALIZED" ]; then
	echo "This repository has already been initialized, skipping..."
	exit 0
fi

echo "Installing LFS hooks..."
git lfs install

echo "Installing pre-commit hooks..."
cat << POST_CHECKOUT >> ".git/hooks/post-checkout"
./setup-git-version.sh
POST_CHECKOUT

echo "Installing post-commit hooks..."
cat << POST_COMMIT >> ".git/hooks/post-commit"
./setup-git-version.sh
POST_COMMIT

echo "Installing pre-commit hooks..."
cat << PRECOMMIT > ".git/hooks/pre-commit"
#!/bin/sh
pipenv install --dev
pipenv run fmt
PRECOMMIT

echo "Initialize project..."
touch .git/PROJECT_INITIALIZED
./setup-git-version.sh
pipenv run fmt
