#!/bin/bash

toplevel=$(git rev-parse --show-toplevel)
target=https://raw.githubusercontent.com/daniel-software/git-hook/master/jenkins/build.pre-push

curl $target -o "$toplevel/.git/hooks/pre-push"

if [ -e "$toplevel/.git/modules" ]; then
	ls "$toplevel/.git/modules" | xargs --no-run-if-empty -I_SUBMODULE_ curl $target -o "$toplevel/.git/modules/_SUBMODULE_/hooks/pre-push"
fi
