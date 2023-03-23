FROM php:8.2-alpine AS phpunit

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apk update && apk add git
RUN git config --global --add safe.directory /app

ENTRYPOINT ["/bin/sh", "-c" , "composer install --ignore-platform-req=ext-xsl && /app/phpunit"]