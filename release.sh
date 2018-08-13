set -ex

USERNAME=$DOCKER_USERNAME
IMAGE=php

git pull
git config --global user.name "CircleCI"

docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

./build.sh
git add -A
git commit -m "version $version" -m "[ci skip]"
git tag -a "$version" -m "version $version"
git push
git push --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version

docker login -u $USERNAME -p $DOCKER_PASSWORD
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
