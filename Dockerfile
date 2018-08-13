FROM circleci/php:latest

ADD VERSION .

RUN sudo apt-get -y -qq update
RUN sudo apt-get install python-pip python-dev build-essential
RUN sudo pip install awsebcli --upgrade

RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends zip

RUN sudo curl --silent --show-error https://getcomposer.org/installer | php
