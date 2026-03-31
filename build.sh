#!/bin/bash

set -e #If any cmd fails means script will stops

BRANCH=${1:-dev} #dev branch will use default if there is No mention branch

IMAGE_NAME="final-project"
DEV_REPO="jagadishhak/dev:$BRANCH"
PROD_REPO="jagadishhak/prod:$BRANCH"

docker build -t $IMAGE_NAME .

if ["$BRANCH" == "dev"]; then
docker tag $IMAGE_NAME $DEV_REPO

elif ["$BRANCH" == "main"]; then
docker tag $IMAGE_NAME $PROD_REPO

else
$BRANCH not found

fi

