#!/bin/bash

toplevel=$(git rev-parse --show-toplevel)
target=https://raw.githubusercontent.com/daniel-software/git-hook/tpc-len2203/jenkins/build.pre-push

curl $target -o "$toplevel/.git/hooks/pre-push"

if [ -e "$toplevel/.git/modules" ]; then
	ls "$toplevel/.git/modules" | xargs --no-run-if-empty -i curl $target -o "$toplevel/.git/modules/{}/hooks/pre-push"
fi
