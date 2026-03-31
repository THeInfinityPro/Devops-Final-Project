#!/bin/bash
set -e


BRANCH=${1:-dev}  # default to dev 

DEV_REPO="jagadishhak/dev:$BRANCH"
PROD_REPO="jagadishhak/prod:$BRANCH"

docker-compose down || true #stop previously existing containers

if [ "$BRANCH" == "dev" ]; then
    sed -i "s|image: .*|image: $DEV_REPO|" docker-compose.yml
elif [ "$BRANCH" == "master" ]; then
    sed -i "s|image: .*|image: $PROD_REPO|" docker-compose.yml
fi

docker-compose up -d
