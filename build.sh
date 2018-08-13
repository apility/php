set -ex

USERNAME=apility
IMAGE=php
docker build -t $USERNAME/$IMAGE:latest .
