FROM circleci/php:latest

ADD VERSION .

RUN sudo apt-get -y -qq update
RUN sudo apt-get install python-pip python-dev build-essential
RUN sudo pip install awsebcli --upgrade

RUN sudo apt-get update && \
    sudo apt-get install -y --no-install-recommends zip

RUN sudo curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
    && sudo curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
    && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
    && sudo php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
    && sudo rm -f /tmp/composer-setup.*
