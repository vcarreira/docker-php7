FROM ubuntu:yakkety

MAINTAINER "Vitor Carreira" <vitor.carreira@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    software-properties-common

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 4F4EA0AAE5267A6C

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu yakkety main" >> /etc/apt/sources.list

# Common PHP pages across containers
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    zip \
    unzip \
    php7.0-cli \
    php7.0-mcrypt \
    php7.0-mysqlnd \
    php7.0-apcu \
    php7.0-memcached \
    php7.0-imap \
    php7.0-pgsql \
    php7.0-intl \
    php7.0-mbstring \
    php7.0-redis \
    php7.0-mongo \
    php7.0-sqlite \
    php7.0-curl \
    php7.0-json \
    php7.0-ssh2 \
    php7.0-gd \
    php7.0-gmp \
    php7.0-zip \
    php-pear \
    php7.0-dev make  \
    wget \
    git \
    curl && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["php", "-a"]
