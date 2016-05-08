#!/bin/bash

set -ev

BRANCH=${BRANCH##master}
BRANCH=${BRANCH:+-${BRANCH}}
TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION-$VARIANT$BRANCH${CUSTOM:+-$CUSTOM}"

docker login -e "$DOCKER_EMAIL" -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

docker push "$TAG:$TAGSPECIFIER"
