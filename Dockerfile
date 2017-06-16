FROM php:7.0-apache
MAINTAINER Alexander Pankov <ap@wdevs.ru>

ARG uid=1000
ARG gid=1000

ENV APACHE_RUN_USER=deploy
ENV APACHE_RUN_GROUP=deploy

RUN apt-get -qq update && apt-get upgrade -y && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libicu-dev \
    libxml2-dev \
    mc \
    wget \
    nano \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql intl xml \
    && rm -rf /var/lib/apt/lists/*

COPY config/php.ini /usr/local/etc/php
COPY config/apache2/ /etc/apache2/

RUN a2enmod rewrite

RUN cd /var/www && wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz \
    && tar -xf dokuwiki-stable.tgz && rm dokuwiki-stable.tgz \
    && mv dokuwiki* dokuwiki \
    && mv dokuwiki html 

RUN groupadd -g $gid deploy && useradd -M -u $uid -g $gid deploy \
    && chown -R deploy:deploy /var/www/html
